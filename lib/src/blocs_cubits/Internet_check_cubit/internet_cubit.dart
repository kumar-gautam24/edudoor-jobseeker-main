import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/routes/app_routes.dart';
import 'package:edudoor_jobseeker/src/view/common/gradients/all_gradient.dart';
import 'package:edudoor_jobseeker/src/view/common/snack_bar/custom_get_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
part "internet_state.dart";

class InternetCubit extends Cubit<InternetState> {
  bool isFirstTime = true;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _streamSubscription;

  InternetCubit() : super(InternetState.initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      Log.debug(tag: "CONNECTIONS", message: result.toString());
      if (result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi)) {
        AppNavigator.pop();

        if (!isFirstTime) {
          CustomGetSnackBar(
            title: "internet_connected".tr,
            subTitle: "internet_connected_message".tr,
            backgroundGradient: AllGradient.successGradient,
            titleColor: Colors.white,
            subTitleColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          ).show();
        }

        emit(InternetState.connected);
        isFirstTime=false;
      } else {
        AppNavigator.push(AppRoutes.NO_INTERNET_CONNECTION, arguments: {"slide": SlideMode.top});

        CustomGetSnackBar(
          title: "internet_disconnected".tr,
          subTitle: "internet_disconnected_message".tr,
          backgroundGradient: AllGradient.errorGradient,
          titleColor: Colors.white,
          subTitleColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        ).show();

        emit(InternetState.disconnected);
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
