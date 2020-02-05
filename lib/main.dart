import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lm_colloseum/blocs/i18n_bloc.dart';
import 'package:lm_colloseum/blocs/navigation_bloc.dart';
import 'package:lm_colloseum/blocs/theme_bloc.dart';
import 'package:lm_colloseum/models/enums/language.enum.dart';
import 'package:lm_colloseum/models/enums/theme.enum.dart';
import 'package:lm_colloseum/models/enums/route.enum.dart';
import 'package:lm_colloseum/route.dart';
import 'package:lm_colloseum/screens/template/template_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() => runApp(App());

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
      child: BlocBuilder<I18nBloc, I18NState>(
        builder: (_, i18nState) => BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => _buildApp(i18nState.locale.asObject, themeState.theme.asObject),
        ),
      ),
    );
  }

  Widget _buildApp(locale, theme) {
    return MaterialApp(
      title: 'Colosseum',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        LanguageEnum.EN.asObject,
        LanguageEnum.RO.asObject,
      ],
      theme: theme,
      locale: locale,
      builder: (context, child) => TemplateScreen(child),
      home: ScreenTypeLayout(
        mobile: Navigator(
          key: NavigationBloc.navigatorKey,
          onGenerateRoute: generateRouteMobile,
          initialRoute: RouteEnum.Home.str,
        ),
        tablet: Navigator(
          key: NavigationBloc.navigatorKey,
          onGenerateRoute: generateRouteTablet,
          initialRoute: RouteEnum.Home.str,
        ),
        desktop:Navigator(
          key: NavigationBloc.navigatorKey,
          onGenerateRoute: generateRouteTablet,
          initialRoute: RouteEnum.Home.str,
        ),
      ),
    );
  }
}
