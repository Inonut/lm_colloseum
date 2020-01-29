import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/intl_bloc.dart';
import 'package:lm_colloseum/generated/l10n.dart';

extension IntlExt on S {

  Widget text(Function(S) textFn, {
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
    if(textFn == null) {
      textFn = (s) => '';
    }

    return BlocBuilder<IntlBloc, Locale>(
      builder: (context, state) {
        return Text(
            textFn(this),
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