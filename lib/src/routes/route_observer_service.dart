import 'package:edudoor_jobseeker/src/firebase/firebase_analytics.dart';
import 'package:flutter/material.dart';

class CustomRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final to = _isDialogRoute(route) ? (route as PopupRoute).barrierLabel : route.settings.name;
    final from = previousRoute == null
        ? "no_previous_routes"
        : _isDialogRoute(previousRoute)
            ? (previousRoute as PopupRoute).barrierLabel
            : previousRoute.settings.name;
    TrackingService.logNavigation(from, to);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    final to = _isDialogRoute(route) ? (route as PopupRoute).barrierLabel : route.settings.name;
    final from = previousRoute == null
        ? "no_previous_routes"
        : _isDialogRoute(previousRoute)
            ? (previousRoute as PopupRoute).barrierLabel
            : previousRoute.settings.name;
    TrackingService.logNavigation(from, to);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    final to = newRoute == null
        ? "route_not_specified"
        : _isDialogRoute(newRoute)
            ? (newRoute as PopupRoute).barrierLabel
            : newRoute.settings.name;
    final from = oldRoute == null
        ? "no_previous_routes"
        : _isDialogRoute(oldRoute)
            ? (oldRoute as PopupRoute).barrierLabel
            : oldRoute.settings.name;
    TrackingService.logNavigation(from, to);
  }

  bool _isDialogRoute(Route<dynamic> route) {
    return route is PopupRoute;
  }
}
