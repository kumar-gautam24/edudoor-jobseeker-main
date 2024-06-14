part of 'application_bloc.dart';

@immutable 
sealed class ApplicationEvent {}

final class ApplicationSetupEvent extends ApplicationEvent {}
