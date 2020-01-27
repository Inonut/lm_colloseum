import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/extensions/intl/intl_bloc.dart';

extension IntlExtension on Text {

  Widget get intl {
    return BlocBuilder<IntlBloc, IntlState>(
      builder: (context, state) {
        return this;
      },
    );
  }
}