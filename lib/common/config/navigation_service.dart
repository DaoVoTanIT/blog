import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  pop(value) {
    return navigatorKey.currentState?.pop(value);
  }

  NavigatorState? get currentState {
    return navigatorKey.currentState;
  }

  BuildContext? get currentContext {
    return navigatorKey.currentContext;
  }

  String? get currentRoute => NavigationHistoryObserver().top?.settings.name;

  goBack() {
    return navigatorKey.currentState?.pop();
  }

  popUntil(String desiredRoute) {
    return navigatorKey.currentState?.popUntil((route) {
      return route.settings.name == desiredRoute;
    });
  }

  Future<Object?>? pushNamedAndRemoveUntil(
      route, bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      route,
      predicate,
    );
  }

  pushReplacementNamed(String desiredRoute, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(desiredRoute, arguments: arguments);
  }

  BuildContext? getNavigationContext() {
    return navigatorKey.currentState?.context;
  }
}
