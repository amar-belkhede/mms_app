part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {}

class OtpVerifyEvent extends AuthEvent {}

class AuthSuccessEvent extends AuthEvent {}
