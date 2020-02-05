import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lm_colloseum/models/enums/route.enum.dart';
import 'package:lm_colloseum/screens/home/home_screen.dart';
import 'package:lm_colloseum/screens/settings/settings_screen.dart';

Route<dynamic> generateRouteTablet(RouteSettings settings) {
  if (settings.name == RouteEnum.Home.str) {
    return _getPageRoute(HomeScreen(), settings);
  }

  return _getPageRoute(HomeScreen(), settings);
}

Route<dynamic> generateRouteMobile(RouteSettings settings) {
  if (settings.name == RouteEnum.Home.str) {
    return _getPageRoute(HomeScreen(), settings);
  } else if (settings.name == RouteEnum.Settings.str) {
    return _getPageRoute(SettingsScreen(), settings);
  }

  return _getPageRoute(HomeScreen(), settings);
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            ),
          ),
        );
}
