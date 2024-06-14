part of 'count_down_bloc.dart';

abstract class CountDownState {}

class CountDownInitialState extends CountDownState {}

class CountDownInProcessState extends CountDownState {
  final int duration;

  CountDownInProcessState({required this.duration});

  CountDownInProcessState copyWith({int? duration}) {
    return CountDownInProcessState(duration: duration ?? this.duration);
  }
}

class CountDownCompletedState extends CountDownState {}

