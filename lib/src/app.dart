import 'package:edudoor_jobseeker/src/blocs_cubits/Internet_check_cubit/internet_cubit.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/application_bloc/application_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/firebase/firebase_analytics.dart';
import 'package:edudoor_jobseeker/src/localization/local_language.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/routes/route_observer_service.dart';
import 'package:edudoor_jobseeker/src/sizer/sizer.dart';
import 'package:edudoor_jobseeker/src/themes/themes.dart';
import 'package:edudoor_jobseeker/src/view/authentication/login_screen/login_screen.dart';
import 'package:edudoor_jobseeker/src/view/bottom_navigator/bottom_navigator.dart';
import 'package:edudoor_jobseeker/src/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:firebase_analytics/observer.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    AllBloc.applicationBloc.add(ApplicationSetupEvent());
  }

  @override
  void dispose() {
    AllBloc.dispose();
    super.dispose();
  }

  static FirebaseAnalyticsObserver firebaseObserver = FirebaseAnalyticsObserver(analytics: TrackingService.getAnalytics());
  final CustomRouteObserver customRouteObserver = CustomRouteObserver();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AllBloc.providers,
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        buildWhen: (prevState, currentState) => currentState is AuthenticationInitialState || currentState is AuthenticationSuccessState || currentState is AuthenticationFailedState,
        builder: (context, auth) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                navigatorObservers: [firebaseObserver, customRouteObserver],
                navigatorKey: AppNavigator.navigatorKey,
                debugShowCheckedModeBanner: false,
                translations: LocalLanguage(),
                locale: Get.deviceLocale,
                fallbackLocale: const Locale('en', 'US'),
                title: 'title'.tr,
                theme: AppTheme.light(),
                darkTheme: AppTheme.dark(),
                onGenerateRoute: (settings) {
                  return AppNavigator().getRoute(settings);
                },
                home: BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, internetState) {
                    return BlocBuilder<ApplicationBloc, ApplicationState>(
                      builder: (context, application) {
                        if (application is ApplicationCompleteState) {
                          if (auth is AuthenticationSuccessState) {
                            return const BottomNavigator();
                          }
                          if (auth is AuthenticationFailedState) {
                            return const LoginScreen();
                          }
                        }
                        return const SplashScreen();
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
