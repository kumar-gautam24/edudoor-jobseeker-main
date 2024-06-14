part of 'redirect_bloc.dart';

@immutable
sealed class RedirectEvent {}

class RedirectShowEvent extends RedirectEvent {}

class RedirectHideEvent extends RedirectEvent {}
