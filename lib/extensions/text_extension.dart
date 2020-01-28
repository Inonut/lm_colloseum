import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/intl_bloc.dart';

extension TextExt on Widget {

  Widget intl([Function textFn]) {
    return BlocBuilder<IntlBloc, Locale>(
      builder: (context, state) {
        return Text(
          '',
          style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10),
        );
      },
    );
  }
}
