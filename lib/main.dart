import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', "US"),
        const Locale('ro', "RO"),
      ],
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.red,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.cyanAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            textTheme: ButtonTextTheme.accent,
          )),
      home: I18n(
        initialLocale: Locale("en", "US"),
        child: HomeScreen(),
      ),
    );
  }
}
