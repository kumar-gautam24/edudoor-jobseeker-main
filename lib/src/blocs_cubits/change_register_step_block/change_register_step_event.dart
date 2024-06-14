part of 'change_register_step_bloc.dart';

sealed class ChangeRegisterStepEvent {}

final class ChangeRegisterStepUpdateEvent extends ChangeRegisterStepEvent {
  final int activeStep;
  ChangeRegisterStepUpdateEvent({required this.activeStep});
}

class ChangeRegisterStepIncrementEvent extends ChangeRegisterStepEvent {}
