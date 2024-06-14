part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

final class AuthenticationInitialState extends AuthenticationState {}

final class AuthenticationLoadingOTPState extends AuthenticationState {
  final bool isWhatsapp;
  AuthenticationLoadingOTPState({required this.isWhatsapp});
}

final class AuthenticationSuccessOTPState extends AuthenticationState {
  final String phone;
  final String hash;
  final bool isWhatsapp;
  AuthenticationSuccessOTPState({required this.phone, required this.hash, required this.isWhatsapp});
}

final class AuthenticationLoadingState extends AuthenticationState {}

final class AuthenticationFailedState extends AuthenticationState {}

final class AuthenticationSuccessState extends AuthenticationState {}

final class AuthenticationUpdatingState extends AuthenticationState {}

final class AuthenticationSuccessEmailOTPState extends AuthenticationState {
  final String email;
  final String hash;
  AuthenticationSuccessEmailOTPState({required this.email, required this.hash});
}

final class AuthenticationEmailVerificationState extends AuthenticationState {}

final class AuthenticationStaticUpdatingState extends AuthenticationState {}
