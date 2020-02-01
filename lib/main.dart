import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:lm_colloseum/blocs/i18n_bloc.dart';
import 'package:lm_colloseum/blocs/navigation_bloc.dart';
import 'package:lm_colloseum/blocs/theme_bloc.dart';
import 'package:lm_colloseum/screens/detail/detail_screen.dart';
import 'package:lm_colloseum/screens/home/home_screen.dart';

//void main() => runApp(MyApp());
void main() => runApp(
      DevicePreview(
        builder: (context) => App(),
      ),
    );

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
      ],
      child: AppListeners(),
    );
  }
}

class AppListeners extends StatefulWidget {
  @override
  State createState() => _AppState();
}

class _AppState extends State<AppListeners> {
  var _reloadCtrl = StreamController();

  @override
  Widget build(BuildContext context) => MultiBlocListener(
    listeners: [
      BlocListener<I18nBloc, I18NState>(
        listener: (context, state) => this._reloadCtrl.add(null),
      ),
      BlocListener<ThemeBloc, ThemeState>(
        listener: (context, state) => this._reloadCtrl.add(null),
      )
    ],
    child: StreamBuilder<Object>(
        stream: _reloadCtrl.stream,
        builder: (context, snapshot) {
          return ColosseumApp();
        }
    ),
  );

  @override
  void dispose() {
    this._reloadCtrl.close();
    super.dispose();
  }
}

class ColosseumApp extends StatelessWidget {
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
      theme: (BlocProvider.of<ThemeBloc>(context).state as ThemeChanged).theme,
      routes: {
        HomeRoute().route: (context) => HomeScreen(),
        DetailsRoute().route: (context) => DetailScreen()
      },
      initialRoute: HomeRoute().route,
    );
  }
}
