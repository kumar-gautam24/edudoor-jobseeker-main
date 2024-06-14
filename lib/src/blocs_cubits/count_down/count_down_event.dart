part of 'count_down_bloc.dart';

abstract class CountDownEvent {}

class CountDownStartEvent extends CountDownEvent {}

class CountDownEndEvent extends CountDownEvent {}

class CountDownUpdateEvent extends CountDownEvent {
  final int duration;
  CountDownUpdateEvent({required this.duration});
}
