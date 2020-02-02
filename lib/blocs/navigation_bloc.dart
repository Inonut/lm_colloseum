import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colloseum/models/enums/route.enum.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  List<RouteEnum> _routePath = [RouteEnum.Home];

  @override
  NavigationState get initialState => NavigationChanged(RouteEnum.Home);

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
    yield* _mapPushRouteToState(RouteEnum.Home);
  }

  Stream<NavigationState> _mapSettingsRouteToState(SettingsRoute event) async* {
    yield* _mapPushRouteToState(RouteEnum.Settings);
  }

  Stream<NavigationState> _mapBackRouteToState(BackRoute event) async* {
    this._routePath.removeLast();
    NavigationBloc.navigatorKey.currentState.pop();
    yield NavigationChanged(this._routePath.last);
  }

  Stream<NavigationState> _mapPushRouteToState(RouteEnum routeEnum) async* {
    if(!this._routePath.contains(routeEnum)) {
      this._routePath.add(routeEnum);
      NavigationBloc.navigatorKey.currentState.pushNamed(routeEnum.str);
      yield NavigationChanged(routeEnum);
    } else {
      yield* _mapBackRouteToState(BackRoute());
    }
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

  RouteEnum get route;
}

class NavigationChanged extends NavigationState {
  final RouteEnum route;

  const NavigationChanged(this.route);

  @override
  List<Object> get props => [this.route];
}