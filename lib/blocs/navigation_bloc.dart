import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/models/enums/route.enum.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  List<RouteEnum> _routePath = [RouteEnum.Home];

  @override
  NavigationState get initialState => NavigationChanged(RouteEnum.Home.str);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if(event is HomeRoute) {
      yield* _mapHomeRouteToState(event);
    } else if(event is SettingsRoute) {
      yield* _mapSettingsRouteToState(event);
    } else if(event is BackRoute) {
      yield* _mapBackRouteToState(event);
    }
  }

  Stream<NavigationState> _mapHomeRouteToState(HomeRoute event) async* {
    this._routePath.add(RouteEnum.Home);
    NavigationBloc.navigatorKey.currentState.pushNamed(RouteEnum.Home.str);
    yield NavigationChanged(RouteEnum.Home.str);
  }

  Stream<NavigationState> _mapSettingsRouteToState(SettingsRoute event) async* {
    this._routePath.add(RouteEnum.Settings);
    NavigationBloc.navigatorKey.currentState.pushNamed(RouteEnum.Settings.str);
    yield NavigationChanged(RouteEnum.Settings.str);
  }

  Stream<NavigationState> _mapBackRouteToState(BackRoute event) async* {
    this._routePath.removeLast();
    NavigationBloc.navigatorKey.currentState.pop();
    yield NavigationChanged(this._routePath.last.str);
  }
}


abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class HomeRoute extends NavigationEvent {}
class SettingsRoute extends NavigationEvent {}
class BackRoute extends NavigationEvent {}


abstract class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationChanged extends NavigationState {
  final String route;

  const NavigationChanged(this.route);

  @override
  List<Object> get props => [this.route];
}

class Back extends NavigationState {
  const Back();

  @override
  List<Object> get props => [];
}