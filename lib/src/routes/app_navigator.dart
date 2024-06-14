import 'package:edudoor_jobseeker/src/app.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/routes/app_routes.dart';
import 'package:edudoor_jobseeker/src/routes/scaffold_wrapper.dart';
import 'package:edudoor_jobseeker/src/routes/slides/slide_from_bottom_route.dart';
import 'package:edudoor_jobseeker/src/routes/slides/slide_from_left_route.dart';
import 'package:edudoor_jobseeker/src/routes/slides/slide_from_right_route.dart';
import 'package:edudoor_jobseeker/src/routes/slides/slide_from_top_route.dart';
import 'package:edudoor_jobseeker/src/view/authentication/otp_screen/otp_screen.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/complete_profile.dart';
import 'package:edudoor_jobseeker/src/view/no_internet_page/no_internet_screen.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  SlideMode defaultSlide = SlideMode.right;

  static NavigatorState get state => navigatorKey.currentState!;

  static Future push<T>(String route, {Object? arguments}) {
    return state.pushNamed(route, arguments: arguments);
  }

  static void pop() {
    if (state.canPop()) state.pop();
  }

  static Future replaceWith<T>(String route, {Map<String, dynamic>? arguments}) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String route) {
    return state.popUntil(ModalRoute.withName(route));
  }

  static String currentRoute(context) {
    return ModalRoute.of(context)!.settings.name!;
  }

  Route<dynamic> getRoute(RouteSettings settings) {
    Map<String, dynamic>? arguments = _getArguments(settings);
    switch (settings.name) {
      case AppRoutes.ROOT:
        return _buildRoute(settings, const App(), _getSlideMode(arguments), "HOME_SCREEN");
      case AppRoutes.NO_INTERNET_CONNECTION:
        return _buildRoute(settings, const NoInternet(), _getSlideMode(arguments), "NO_INTERNET_CONNECTION_SCREEN");
      case AppRoutes.VERIFY_OTP:
        return _buildRoute(settings, const OtpScreen(), _getSlideMode(arguments), "VERIFY_SCREEN");
      case AppRoutes.COMPLETE_PROFILE:
        return _buildRoute(settings, const CompleteProfile(), _getSlideMode(arguments), "COMPLETE_PROFILE_SCREEN");
      default:
        return _buildRoute(settings, const App(), SlideMode.right, "HOME_SCREEN");
    }
  }

  _buildRoute(
    RouteSettings routeSettings,
    Widget builder,
    SlideMode slideMode,
    String screenName,
  ) {
    switch (slideMode) {
      case SlideMode.bottom:
        return SlideFromBottomRoute(page: ScaffoldWrapper(screenName: screenName, child: builder), settings: routeSettings);
      case SlideMode.top:
        return SlideFromTopRoute(page: ScaffoldWrapper(screenName: screenName, child: builder), settings: routeSettings);
      case SlideMode.left:
        return SlideFromLeftRoute(page: ScaffoldWrapper(screenName: screenName, child: builder), settings: routeSettings);
      case SlideMode.right:
        return SlideFromRightRoute(page: ScaffoldWrapper(screenName: screenName, child: builder), settings: routeSettings);
    }
  }

  _getArguments(RouteSettings settings) {
    return settings.arguments;
  }

  _getSlideMode(Map<String, dynamic>? arguments) {
    return arguments?['slide'] ?? SlideMode.right;
  }
}
