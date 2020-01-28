import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/generated/l10n.dart';

class IntlBloc extends Bloc<IntlEvent, Locale> {

  @override
  Locale get initialState => Locale.fromSubtags(languageCode: 'en', countryCode: 'US');

  @override
  Stream<Locale> mapEventToState(IntlEvent event) async* {
    if(event is LocaleChanged) {
      yield* _mapLocaleChangedToState(event);
    }
  }

  Stream<Locale> _mapLocaleChangedToState(LocaleChanged event) async* {
    S.load(event.locale);
    yield event.locale;
  }
}

abstract class IntlEvent extends Equatable {
  const IntlEvent();

  @override
  List<Object> get props => [];
}

class LocaleChanged extends IntlEvent {
  final Locale locale;

  const LocaleChanged(this.locale);

  @override
  List<Object> get props => [locale];
}