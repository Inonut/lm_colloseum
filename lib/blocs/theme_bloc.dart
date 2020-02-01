import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeChanged(_appThemeData[ThemeEvent.GreenLight]);

  @override
  Stream<ThemeChanged> mapEventToState(ThemeEvent event) async* {
    yield ThemeChanged(_appThemeData[event]);
  }

  final _appThemeData = {
    ThemeEvent.GreenLight: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
    ),
    ThemeEvent.GreenDark: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
    ),
    ThemeEvent.BlueLight: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ),
    ThemeEvent.BlueDark: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    ),
  };
}

enum ThemeEvent {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeChanged extends ThemeState {
  final ThemeData theme;

  const ThemeChanged(ThemeData this.theme);

  @override
  List<Object> get props => [this.theme];
}