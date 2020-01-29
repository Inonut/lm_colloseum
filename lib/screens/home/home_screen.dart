import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/intl_bloc.dart';
import 'package:lm_colloseum/extensions/intl_extension.dart';
import 'package:lm_colloseum/generated/l10n.dart';

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
                    onPressed: () => BlocProvider.of<IntlBloc>(context).add(LocaleChanged(Locale.fromSubtags(languageCode: 'en', countryCode: 'US'))),
                    child: S.of(context).text(
                          (s) => s.engName,
                          style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
                        ),
                  ),
                  RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    onPressed: () => BlocProvider.of<IntlBloc>(context).add(LocaleChanged(Locale.fromSubtags(languageCode: 'ro', countryCode: 'RO'))),
                    child: S.of(context).text(
                          (s) => s.roName,
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
                child: S.of(context).text((s) => s.hello('ಠ_ಠ'), style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10))),
          )
        ],
      ),
    );
  }
}
