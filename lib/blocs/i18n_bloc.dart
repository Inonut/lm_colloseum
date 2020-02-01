import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_extension/i18n_widget.dart';

class I18nBloc extends Bloc<I18NEvent, I18NState> {
  @override
  I18NState get initialState {
    var locale = const Locale("ro", "RO");
    I18n.define(locale);
    return LocaleChanged(locale);
  }

  @override
  Stream<I18NState> mapEventToState(I18NEvent event) async* {
    switch(event) {
      case I18NEvent.RO: yield* _emitLocale(const Locale("ro", "RO")); break;
      case I18NEvent.EN: yield* _emitLocale(const Locale("en", "US")); break;
    }
  }

  Stream<LocaleChanged> _emitLocale(Locale locale) async* {
    I18n.define(locale);
    yield LocaleChanged(locale);
  }
}

enum I18NEvent {
  EN,
  RO
}

abstract class I18NState extends Equatable {
  const I18NState();
}

class LocaleChanged extends I18NState {
  final Locale locale;

  const LocaleChanged(Locale this.locale);

  @override
  List<Object> get props => [this.locale];
}
