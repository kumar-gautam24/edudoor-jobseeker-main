part of 'application_bloc.dart';

@immutable
sealed class ApplicationState {}

final class ApplicationInitialState extends ApplicationState {}

final class ApplicationCompleteState extends ApplicationState {}
