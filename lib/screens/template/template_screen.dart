import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/blocs/navigation_bloc.dart';
import 'package:lm_colloseum/models/enums/route.enum.dart';
import 'package:lm_colloseum/route.dart';
import 'package:lm_colloseum/screens/settings/settings_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TemplateScreen extends StatelessWidget {
  final Widget child;

  TemplateScreen(Widget this.child);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var currentRoute = BlocProvider.of<NavigationBloc>(context).state.route;
        if(sizingInformation.isDesktop) {
          if(currentRoute == RouteEnum.Settings) {
            BlocProvider.of<NavigationBloc>(context).add(HomeRoute());
          }
          return _TemplateScreenTablet(child);
        }
        if(sizingInformation.isTablet) {
          if(currentRoute == RouteEnum.Settings.str) {
            BlocProvider.of<NavigationBloc>(context).add(HomeRoute());
          }
          return _TemplateScreenTablet(child);
        }

        return _TemplateScreenMobile(child);
      },
    );
  }
}

class _TemplateScreenMobile extends StatelessWidget {
  final Widget child;

  _TemplateScreenMobile(Widget this.child);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(title: Text(Random().nextDouble().toString()), actions: _buildAction(context, state.route)),
          body: child,
      ),
    );
  }

  List<Widget> _buildAction(BuildContext context, RouteEnum route) {
    if (route == RouteEnum.Settings) {
      return [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () => BlocProvider.of<NavigationBloc>(context).add(HomeRoute()),
        )
      ];
    } else if (route == RouteEnum.Home) {
      return [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => BlocProvider.of<NavigationBloc>(context).add(SettingsRoute()),
        )
      ];
    }

    return null;
  }
}

class _TemplateScreenTablet extends StatelessWidget {
  final Widget child;

  _TemplateScreenTablet(Widget this.child);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(Random().nextDouble().toString()),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          drawer: Drawer(
            child: SettingsScreen(),
          ),
          body: child,
      ),
    );
  }
}
