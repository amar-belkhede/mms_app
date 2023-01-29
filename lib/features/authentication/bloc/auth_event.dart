part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthTypeEvent extends AuthEvent {
  AuthTypeEvent({required this.authType});
  AuthenticationType authType;
}

class UserRegisteredEvent extends AuthEvent {}

class UserVerifyEvent extends AuthEvent {}

class AuthSuccessEvent extends AuthEvent {}
