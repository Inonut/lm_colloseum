import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/intl_bloc.dart';
import 'package:lm_colloseum/generated/l10n.dart';
import 'package:lm_colloseum/screens/home/home_screen.dart';

//void main() => runApp(MyApp());
void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colloseum',
      builder: DevicePreview.appBuilder,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale.fromSubtags(languageCode: 'en'),
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.red,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.cyanAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              textTheme: ButtonTextTheme.accent,
          )),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<IntlBloc>(
            create: (BuildContext context) => IntlBloc(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
