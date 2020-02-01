import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:lm_colloseum/blocs/theme_bloc.dart';
import 'package:lm_colloseum/screens/home/home_screen.dart';

//void main() => runApp(MyApp());
void main() => runApp(
      DevicePreview(
        builder: (context) => ThemeApp(),
      ),
    );

class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeData>(builder: (BuildContext context, ThemeData theme) => ColosseumApp(theme))
    );
  }
}

class ColosseumApp extends StatelessWidget {
  final ThemeData theme;

  const ColosseumApp(ThemeData this.theme);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Colosseum',
        builder: DevicePreview.appBuilder,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', "US"),
          const Locale('ro', "RO"),
        ],
        theme: this.theme,
        home: I18n(
          initialLocale: const Locale("en", "US"),
          child: HomeScreen(),
        ));
  }
}
