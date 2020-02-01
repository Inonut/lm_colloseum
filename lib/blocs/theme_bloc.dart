import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/models/app_theme.enum.dart';

class ThemeBloc extends Bloc<AppTheme, ThemeData> {
  @override
  ThemeData get initialState => _appThemeData[AppTheme.GreenLight];

  @override
  Stream<ThemeData> mapEventToState(AppTheme event) async* {
    yield _appThemeData[event];
  }

  final _appThemeData = {
    AppTheme.GreenLight: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
    ),
    AppTheme.GreenDark: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
    ),
    AppTheme.BlueLight: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ),
    AppTheme.BlueDark: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    ),
  };
}
