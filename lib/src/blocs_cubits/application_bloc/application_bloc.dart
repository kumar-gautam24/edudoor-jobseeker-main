import 'package:edudoor_jobseeker/src/configurations/application.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitialState()) {
    on<ApplicationSetupEvent>((event, emit) async {
      await Application().initApplication();
      AllBloc.authenticationBloc.add(AuthenticationCheckEvent());
      emit(ApplicationCompleteState());

    });
  }
}
