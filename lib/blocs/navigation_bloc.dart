import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => NavigationChanged(HomeRoute().route);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    yield NavigationChanged(event.route);
  }
}


abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  String get route;

  @override
  List<Object> get props => [this.route];
}

class HomeRoute extends NavigationEvent {
  final route = 'home';
}

class SettingsRoute extends NavigationEvent {
  final route = 'settings';
}

class DetailsRoute extends NavigationEvent {
  final route = 'details';
}

class BackRoute extends NavigationEvent {
  final route = 'back';
}


abstract class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationChanged extends NavigationState {
  final String route;

  const NavigationChanged(this.route);

  @override
  List<Object> get props => [this.route];
}