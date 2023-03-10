import 'package:go_router/go_router.dart';

import '../../common/app_logo.dart';
import '../../common/mms_app_bar.dart';
import '../../common_import.dart';
import 'signup_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                StringValue.termsAndConditions,
              )
            ],
          ),
        ),
      ),
    );
  }
}
