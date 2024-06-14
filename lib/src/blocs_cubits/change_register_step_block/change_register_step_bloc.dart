import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_register_step_event.dart';

class ChangeRegisterStepBloc extends Bloc<ChangeRegisterStepEvent, int> {
  ChangeRegisterStepBloc() : super(0) {
    on<ChangeRegisterStepUpdateEvent>((event, emit) {
      if (event.activeStep > 4) {
        AppNavigator.pop();
        return;
      }
      emit(event.activeStep);
    });
    on<ChangeRegisterStepIncrementEvent>((event, emit) {
      if (state > 3) {
        AppNavigator.pop();
        return;
      }
      emit(state + 1);
    });
  }
}
