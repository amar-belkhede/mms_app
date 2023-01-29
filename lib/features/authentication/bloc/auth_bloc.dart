import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../features/common_import.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthTypeEvent>(_onSignIn);
    on<UserRegisteredEvent>(_onSignUp);
    on<UserVerifyEvent>(_onOtpVerify);
    on<AuthSuccessEvent>(_onAuthSuccess);
  }

  static AuthBloc of(BuildContext context) {
    return BlocProvider.of<AuthBloc>(context);
  }

  Future<void> _onSignIn(AuthTypeEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(AuthTypeState(authType: event.authType));
  }

  Future<void> _onSignUp(
      UserRegisteredEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(UserRegisteredState(userRegistered: true));
  }

  Future<void> _onOtpVerify(
      UserVerifyEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(UserVerifyState(otpVerified: true));
  }

  Future<void> _onAuthSuccess(
      AuthSuccessEvent event, Emitter<AuthState> emit) async {
    // emit(AuthSuccessState(isAuthenticated: true));
  }
}
