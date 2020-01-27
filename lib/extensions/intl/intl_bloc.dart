import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/generated/l10n.dart';

class IntlBloc extends Bloc<IntlEvent, IntlState> {

  @override
  IntlState get initialState => Reload(Locale.fromSubtags(languageCode: 'en', countryCode: 'US'));

  @override
  Stream<IntlState> mapEventToState(IntlEvent event) async* {
    if(event is LocaleChanged) {
      yield* _mapLocaleChangedToState(event);
    }
  }

  Stream<IntlState> _mapLocaleChangedToState(LocaleChanged event) async* {
    S.load(event.locale);
    yield Reload(event.locale);
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

abstract class IntlState extends Equatable {
  const IntlState();

  @override
  List<Object> get props => [];
}

class Reload extends IntlState {
  final Locale locale;

  const Reload(this.locale);

  @override
  List<Object> get props => [locale];
}