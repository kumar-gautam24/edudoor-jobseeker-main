import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'count_down_event.dart';
part 'count_down_state.dart';

class CountDownBloc extends Bloc<CountDownEvent, CountDownState> {
  Timer? _timer;

  CountDownBloc() : super(CountDownInitialState()) {
    on<CountDownStartEvent>(_onStart);
    on<CountDownEndEvent>(_onEnd);
    on<CountDownUpdateEvent>(_onUpdate);
  }

  Future<void> _onStart(CountDownStartEvent event, Emitter<CountDownState> emit) async {
    _timer?.cancel();
    emit(CountDownInProcessState(duration: 30));
    _startTimer();
  }

  Future<void> _onEnd(CountDownEndEvent event, Emitter<CountDownState> emit) async {
    _timer?.cancel();
    emit(CountDownInitialState());
  }

  Future<void> _onUpdate(CountDownUpdateEvent event, Emitter<CountDownState> emit) async {
    if (state is CountDownInProcessState) {
      final currentInProcessState = state as CountDownInProcessState;
      emit(currentInProcessState.copyWith(duration: event.duration));
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state is CountDownInProcessState) {
        final currentInProcessState = state as CountDownInProcessState;
        if (currentInProcessState.duration > 0) {
          add(CountDownUpdateEvent(duration: currentInProcessState.duration - 1));
        } else {
          add(CountDownEndEvent());
        }
      }
    });
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    return super.close();
  }
}
