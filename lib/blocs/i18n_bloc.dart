import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:lm_colloseum/models/enums/language.enum.dart';

class I18nBloc extends Bloc<I18NEvent, I18NState> {
  @override
  I18NState get initialState {
    I18n.define(LanguageEnum.RO.asObject);
    return LocaleChanged(LanguageEnum.RO);
  }

  @override
  Stream<I18NState> mapEventToState(I18NEvent event) async* {
    if(event is RomanianLang) {
      yield* _emitLocale(LanguageEnum.RO);
    } else if(event is EnglishLang) {
      yield* _emitLocale(LanguageEnum.EN);
    }
  }

  Stream<LocaleChanged> _emitLocale(LanguageEnum locale) async* {
    I18n.define(locale.asObject);
    yield LocaleChanged(locale);
  }
}

abstract class I18NEvent extends Equatable {
  const I18NEvent();

  @override
  List<Object> get props => [];
}
class RomanianLang extends I18NEvent {}
class EnglishLang extends I18NEvent {}

abstract class I18NState extends Equatable {
  const I18NState();

  LanguageEnum get locale;
}

class LocaleChanged extends I18NState {
  final LanguageEnum locale;

  const LocaleChanged(LanguageEnum this.locale);

  @override
  List<Object> get props => [this.locale];
}
