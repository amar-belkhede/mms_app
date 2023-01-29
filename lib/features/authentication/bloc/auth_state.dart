part of 'auth_bloc.dart';

enum AuthenticationType {
  signin,
  signup,
}

@immutable
abstract class AuthState {
  AuthState({
    this.isAuthenticated = false,
  });

  final bool isAuthenticated;
}

class AuthInitial extends AuthState {}

class AuthTypeState extends AuthState {
  AuthTypeState({required this.authType});
  AuthenticationType authType;
}

class UserRegisteredState extends AuthState {
  UserRegisteredState({required this.userRegistered});
  final bool userRegistered;
}

class UserVerifyState extends AuthState {
  UserVerifyState({required this.otpVerified});
  final bool otpVerified;
}

class AuthSuccessState extends AuthState {
  AuthSuccessState({required super.isAuthenticated});
}

class AuthLoadingState extends AuthState {}
