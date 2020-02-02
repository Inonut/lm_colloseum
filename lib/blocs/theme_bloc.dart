import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/models/enums/theme.enum.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeChanged(ThemeEnum.GreenLight.themeData);

  @override
  Stream<ThemeChanged> mapEventToState(ThemeEvent event) async* {
    if(event is GreenLightTheme) {
      yield ThemeChanged(ThemeEnum.GreenLight.themeData);
    } else if(event is GreenDarkTheme) {
      yield ThemeChanged(ThemeEnum.GreenDark.themeData);
    } else if(event is BlueLightTheme) {
      yield ThemeChanged(ThemeEnum.BlueLight.themeData);
    } else if(event is BlueDarkTheme) {
      yield ThemeChanged(ThemeEnum.BlueDark.themeData);
    }
  }
}

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}
class GreenLightTheme extends ThemeEvent {}
class GreenDarkTheme extends ThemeEvent {}
class BlueLightTheme extends ThemeEvent {}
class BlueDarkTheme extends ThemeEvent {}


abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeChanged extends ThemeState {
  final ThemeData theme;

  const ThemeChanged(ThemeData this.theme);

  @override
  List<Object> get props => [this.theme];
}