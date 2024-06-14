part of 'change_education_step_bloc.dart';

sealed class ChangeEducationStepEvent {}

final class ChangeEducationStepUpdateEvent extends ChangeEducationStepEvent {
  final int activeStep;
  ChangeEducationStepUpdateEvent({required this.activeStep});
}

class ChangeEducationStepIncrementEvent extends ChangeEducationStepEvent {
  bool onlyUpdate;
  ChangeEducationStepIncrementEvent({this.onlyUpdate = false});
}
