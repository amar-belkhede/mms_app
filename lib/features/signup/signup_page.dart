import 'package:go_router/go_router.dart';

import '../common/app_logo.dart';
import '../common/mms_app_bar.dart';
import '../common_import.dart';
import 'signup_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static const String name = 'signup';
  static const String path = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mmsAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                const AppLogo(),
                const SizedBox(height: 30),
                SignupForm(formKey: _formKey),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'By tapping "Create Account", You will\n accept all terms & Conditions.',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
