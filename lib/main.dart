import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lm_colloseum/blocs/i18n_bloc.dart';
import 'package:lm_colloseum/blocs/navigation_bloc.dart';
import 'package:lm_colloseum/blocs/theme_bloc.dart';
import 'package:lm_colloseum/models/enums/language.enum.dart';
import 'package:lm_colloseum/models/enums/route.enum.dart';
import 'package:lm_colloseum/route.dart';

//void main() => runApp(MyApp());
void main() => runApp(DevicePreview(
  builder: (context) => App(),
));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<I18nBloc>(
          create: (BuildContext context) => I18nBloc(),
        ),
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
      ],
      child: BlocBuilder<I18nBloc, I18NState> (
        builder: (_, i18nState) => BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => _buildApp(
              (i18nState as LocaleChanged).locale,
              (themeState as ThemeChanged).theme
          ),
        ),
      ),
    );
  }

  Widget _buildApp(locale, theme) {
    return MaterialApp(
      title: 'Colosseum',
      builder: DevicePreview.appBuilder,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        LanguageEnum.EN.locale,
        LanguageEnum.RO.locale,
      ],
      theme: theme,
      locale: locale,
      home: Navigator(
        key: NavigationBloc.navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: RouteEnum.Home.str,
      ),

    );
  }
}
