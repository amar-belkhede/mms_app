import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../features/common_import.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<OtpVerifyEvent>(_onOtpVerify);
    on<AuthSuccessEvent>(_onAuthSuccess);
  }

  static AuthBloc of(BuildContext context) {
    return BlocProvider.of<AuthBloc>(context);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthSuccessState(isAuthenticated: true));
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpState(userRegistered: true));
  }

  Future<void> _onOtpVerify(
      OtpVerifyEvent event, Emitter<AuthState> emit) async {
    emit(OtpVerifyState(otpVerified: true));
  }

  Future<void> _onAuthSuccess(
      AuthSuccessEvent event, Emitter<AuthState> emit) async {
    emit(AuthSuccessState(isAuthenticated: true));
  }
}
