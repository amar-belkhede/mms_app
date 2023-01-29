import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../util/string_ext.dart';
import '../common/app_logo.dart';
import '../common/mms_app_bar.dart';
import '../common/mms_text_button.dart';
import '../common/signup_form_field.dart';
import '../common_import.dart';
import '../home/home_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  static const String name = 'signin';
  static const String path = '/signin';

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mmsAppBar(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 100,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SignupFormfield(
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.number,
                        bottomPadding: 15,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value != null && !value.isValidPhone) {
                            return 'Enter valid phone name, should contain 10 digit';
                          }
                          return null;
                        },
                      ),
                      SignupFormfield(
                        hintText: 'PIN',
                        keyboardType: TextInputType.number,
                        bottomPadding: 0,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value != null && !value.isValidPin) {
                            return 'Enter valid PIN, should be of 4 digits ';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          rememberMeComponent(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget your Password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.mmsIndigo),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MmsButton(
                        buttonText: 'Submit',
                        textColor: Colors.white,
                        backgroundColor: AppColors.mmsIndigo,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.push(HomePage.path);
                          }
                        },
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Do you have an account? Sign up here',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.mmsIndigo),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row rememberMeComponent() {
    return Row(
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (bool? value) {
            setState(() {
              _rememberMe = value!;
            });
          },
        ),
        Text(
          'Remember me',
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: AppColors.mmsIndigo),
        ),
      ],
    );
  }
}
