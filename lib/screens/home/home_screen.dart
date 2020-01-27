import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/extensions/intl/intl_bloc.dart';
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
            decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    onPressed: () => BlocProvider.of<IntlBloc>(context).add(LocaleChanged(Locale.fromSubtags(languageCode: 'en', countryCode: 'US'))),
                    child: BlocBuilder<IntlBloc, IntlState>(
                      builder: (context, state) => Text(
                        S.of(context).engName,
                        style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
                      ),
                    ),
                  ),
                  RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    onPressed: () => BlocProvider.of<IntlBloc>(context).add(LocaleChanged(Locale.fromSubtags(languageCode: 'ro', countryCode: 'RO'))),
                    child: BlocBuilder<IntlBloc, IntlState>(
                      builder: (context, state) => Text(
                        S.of(context).roName,
                        style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
                      ),
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
              child: BlocBuilder<IntlBloc, IntlState>(
                builder: (context, state) {
                  return Text(
                    S.of(context).hello('ಠ_ಠ'),
                    style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
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
