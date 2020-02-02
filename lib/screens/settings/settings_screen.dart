import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lm_colloseum/extensions/translation.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
      child: Center(
        child: Text('A nice menu with settings'.i18n),
      ),
    );
  }
}
