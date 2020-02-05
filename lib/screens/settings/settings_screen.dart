import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/i18n_bloc.dart';
import 'package:lm_colloseum/extensions/translation.dart';
import 'package:lm_colloseum/models/enums/language.enum.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.palette),
          title: Text('Theme'.i18n),
          dense: true,
        ),
        BlocBuilder<I18nBloc, I18NState>(
          builder: (_, i18nState) => ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'.i18n),
            subtitle: Text(i18nState.locale.fullName),
            dense: true,
          ),
        )
      ],
    );
  }
}
