import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../../common/confirmation_form_field.dart';
import '../../common/custom_form_field.dart';
import '../../common/mms_app_bar.dart';
import '../../common/mms_text_button.dart';
import '../../common_import.dart';
import '../../home/home_page.dart';
import '../messageInfo/message_page.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  bool formCompleted = true;

  @override
  Widget build(BuildContext context) {
    void onChanged(String value) {
      if (value.length == 1) {
        FocusScope.of(context).nextFocus();
      }
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
              child: Image(
                image: AssetImage('assets/verification.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Check your Phone',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              width: 300,
              child: const Text(
                textAlign: TextAlign.center,
                'To confirm your account, enter 4 digit code send to +91 7718064894',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConfirmationFormField(
                    controller: _fieldOne,
                    autofocus: true,
                    onChanged: onChanged,
                    validator: (value) {
                      if (value?.length != 1) {
                        setState(() {
                          formCompleted = false;
                        });
                      } else {
                        setState(() {
                          formCompleted = true;
                        });
                      }
                    },
                  ),
                  ConfirmationFormField(
                    controller: _fieldTwo,
                    onChanged: onChanged,
                    validator: (value) {
                      if (value?.length != 1) {
                        setState(() {
                          formCompleted = false;
                        });
                      } else {
                        setState(() {
                          formCompleted = true;
                        });
                      }
                    },
                  ),
                  ConfirmationFormField(
                    controller: _fieldThree,
                    onChanged: onChanged,
                    validator: (value) {
                      if (value?.length != 1) {
                        setState(() {
                          formCompleted = false;
                        });
                      } else {
                        setState(() {
                          formCompleted = true;
                        });
                      }
                    },
                  ),
                  ConfirmationFormField(
                    controller: _fieldFour,
                    onChanged: onChanged,
                    validator: (value) {
                      if (value?.length != 1) {
                        setState(() {
                          formCompleted = false;
                        });
                      } else {
                        setState(() {
                          formCompleted = true;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MmsButton(
                    buttonText: 'Submit',
                    textColor: Colors.white,
                    backgroundColor: AppColors.mmsIndigo,
                    onPressed: () {
                      if (_formKey.currentState!.validate() && formCompleted) {
                        // context.push(MessagePage.path);
                        AuthBloc.of(context).add(UserVerifyEvent());
                      }
                    },
                  ),
                  MmsButton(
                    buttonText: 'Resent Code',
                    textColor: Colors.black,
                    backgroundColor: AppColors.lightGrey,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
