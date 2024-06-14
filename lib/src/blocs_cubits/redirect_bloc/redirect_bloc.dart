import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/routes/app_routes.dart';
import 'package:edudoor_jobseeker/src/secure_storage/local_storage_keys.dart';
import 'package:edudoor_jobseeker/src/secure_storage/secure_storage.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'redirect_event.dart';
part 'redirect_state.dart';

class RedirectBloc extends Bloc<RedirectEvent, RedirectState> {
  RedirectBloc() : super(RedirectState.initial) {
    on<RedirectShowEvent>((event, emit) async {
      final String? redirectedOnce = await SecureStorage.read(key: LocalStorageKeys.REDIRECT_COMPLETE_PROFILE);
      if (redirectedOnce == null) {
        emit(RedirectState.show);
        SecureStorage.write(key: LocalStorageKeys.REDIRECT_COMPLETE_PROFILE, value: 'true');
      }
    });
    on<RedirectHideEvent>((event, emit) {
      AppNavigator.push(AppRoutes.COMPLETE_PROFILE, arguments: {'slide': SlideMode.right});
      emit(RedirectState.hide);
    });
  }
}
