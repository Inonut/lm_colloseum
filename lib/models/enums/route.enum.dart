enum RouteEnum { Home, Settings }

extension RouteMethods on RouteEnum {
  String get str {
    switch (this) {
      case RouteEnum.Home:
        return '/home';
      case RouteEnum.Settings:
        return '/settings';
      default:
        return null;
    }
  }
}
