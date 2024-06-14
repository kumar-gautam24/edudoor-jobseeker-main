import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_register_step_block/change_register_step_bloc.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_education_step_event.dart';

class ChangeEducationStepBloc extends Bloc<ChangeEducationStepEvent, int> {
  ChangeEducationStepBloc() : super(0) {
    on<ChangeEducationStepUpdateEvent>((event, emit) {
      emit(event.activeStep);
    });
    on<ChangeEducationStepIncrementEvent>((event, emit) {
      if(state == 7){
        if(event.onlyUpdate){
          AppNavigator.pop();
          return;
        }else{
          AllBloc.changeRegisterStepBloc.add(ChangeRegisterStepIncrementEvent());
        }
      }
      emit(state + 1);
    });
  }
}
