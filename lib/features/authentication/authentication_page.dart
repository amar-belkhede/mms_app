import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/display_message.dart';
import '../common/mms_app_bar.dart';
import '../common_import.dart';
import 'bloc/auth_bloc.dart';
import 'confirmation/otp_verification_page.dart';
import 'messageInfo/message_page.dart';
import 'signin/signin_page.dart';
import 'signup/signup_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  static const String name = 'authentication';
  static const String path = '/authentication';

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mmsAppBar(context),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthTypeState) {
            return (state.authType == AuthenticationType.signup)
                ? const SignupPage()
                : const SigninPage();
          } else if (state is UserRegisteredState) {
            return const OtpVerificationPage();
          } else if (state is UserVerifyState) {
            return const MessagePage();
          } else if (state is AuthLoadingState) {
            return const DisplayMessage(
              message: 'Loading...',
              showProgressIndicator: true,
            );
          } else if (state is AuthSuccessState) {
            return Container();
          }

          return Center(
              child: Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.headlineMedium,
          ));
        },
      ),
    );
  }
}
