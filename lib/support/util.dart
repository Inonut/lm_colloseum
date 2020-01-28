import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/intl_bloc.dart';

class Util {
  static textIntl(Function textFn, {
    Key key,
    style,
    strutStyle,
    textAlign,
    textDirection,
    locale,
    softWrap,
    overflow,
    textScaleFactor,
    maxLines,
    semanticsLabel,
    textWidthBasis,
  }) {
    return BlocBuilder<IntlBloc, Locale>(
      builder: (context, state) {
        return Text(
            textFn(),
            key: key,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis
        );
      },
    );
  }
}