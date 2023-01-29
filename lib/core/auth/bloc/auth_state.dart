part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  AuthState({
    this.isAuthenticated = false,
  });

  final bool isAuthenticated;
}

class AuthInitial extends AuthState {}

class SignInState extends AuthState {
  SignInState(bool isAuthenticated) : super(isAuthenticated: isAuthenticated);
}

class SignUpState extends AuthState {
  SignUpState({required this.userRegistered});
  final bool userRegistered;
}

class OtpVerifyState extends AuthState {
  OtpVerifyState({required this.otpVerified});
  final bool otpVerified;
}

class AuthSuccessState extends AuthState {
  AuthSuccessState({required super.isAuthenticated});
}
