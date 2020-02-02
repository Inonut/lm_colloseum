import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/i18n_bloc.dart';
import 'package:lm_colloseum/blocs/navigation_bloc.dart';
import 'package:lm_colloseum/blocs/theme_bloc.dart';
import 'package:lm_colloseum/extensions/translation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  onPressed: () => BlocProvider.of<I18nBloc>(context).add(EnglishLang()),
                  child: Text(
                    'English'.i18n,
                    style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
                  ),
                ),
                RaisedButton(
                  textTheme: Theme.of(context).buttonTheme.textTheme,
                  onPressed: () => BlocProvider.of<I18nBloc>(context).add(RomanianLang()),
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
        ),
      ],
    );
  }
}
