import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/redirect_bloc/redirect_bloc.dart';
import 'package:edudoor_jobseeker/src/notification_handlers/notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edudoor_jobseeker/src/permissions/app_permission.dart';

part 'bottom_navigator_startup_event.dart';
part 'bottom_navigator_startup_state.dart';

class BottomNavigatorStartupBloc extends Bloc<BottomNavigatorStartupEvent, BottomNavigatorStartupState> {
  BottomNavigatorStartupBloc() : super(BottomNavigatorStartupInitialState()) {
    on<BottomNavigatorStartupSetupEvent>((event, emit) {
      AllBloc.redirectBloc.add(RedirectShowEvent());
      AppPermission.requestPermission();
      NotificationService.handleReceivedNotification();
      emit(BottomNavigatorStartupCompleteState());
    });
  }
}
