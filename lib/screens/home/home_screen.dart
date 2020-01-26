import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lm_colloseum/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  StreamController languageChange;
  Stream languageStream;

  _MyHomePageState() {
    languageChange = StreamController();
    languageStream = languageChange.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(AppLocalization.of(context).heyWorld),
          ),
      body: Column(
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorDark),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    onPressed: () {
                      S.load(Locale.fromSubtags(
                          languageCode: 'en', countryCode: 'US'));
                      languageChange.add('en');
                    },
                    child: StreamBuilder(
                        stream: languageStream,
                        builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) =>
                            Text(
                              S.of(context).engName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .apply(fontSizeDelta: 10),
                            )),
                  ),
                  RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    onPressed: () {
                      S.load(Locale.fromSubtags(
                          languageCode: 'ro', countryCode: 'RO'));
                      languageChange.add('ro');
                    },
                    child: StreamBuilder(
                        stream: languageStream,
                        builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) =>
                            Text(
                              S.of(context).roName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .apply(fontSizeDelta: 10),
                            )),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColorLight),
              alignment: Alignment.center,
              child: StreamBuilder(
                stream: languageStream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  print('asdasda ${snapshot.data}');
                  return Text(
                    S.of(context).hello('ಠ_ಠ'),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .apply(fontSizeDelta: 40),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    languageChange.close();
    super.dispose();
  }
}
