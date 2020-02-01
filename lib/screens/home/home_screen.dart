import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:lm_colloseum/extensions/translation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(AppLocalization.of(context).heyWorld),
          ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    onPressed: () => I18n.of(context).locale = const Locale("en", "US"),
                    child: Text(
                      'English'.i18n,
                      style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
                    ),
                  ),
                  RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    onPressed: () => I18n.of(context).locale = const Locale("ro", "RO"),
                    child: Text(
                      'Romanian'.i18n,
                      style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
                alignment: Alignment.center,
                child: Text('Hello %s'.i18n.fill(['ಠ_ಠ']), style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10))),
          )
        ],
      ),
    );
  }
}
