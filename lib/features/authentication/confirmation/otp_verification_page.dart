import 'package:flutter/services.dart';

import '../../common/confirmation_form_field.dart';
import '../../common/mms_text_button.dart';
import '../../common_import.dart';
import '../bloc/auth_bloc.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  bool formCompleted = true;

  @override
  void dispose() {
    _fieldOne.dispose();
    _fieldTwo.dispose();
    _fieldThree.dispose();
    _fieldFour.dispose();
    super.dispose();
  }

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
                StringValue.checkYourPhone,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              width: 300,
              child: Text(
                textAlign: TextAlign.center,
                StringValue.optMessageSubtitle,
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
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    validator: onOtpValidate,
                  ),
                  ConfirmationFormField(
                    controller: _fieldTwo,
                    onChanged: onChanged,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    validator: onOtpValidate,
                  ),
                  ConfirmationFormField(
                    controller: _fieldThree,
                    onChanged: onChanged,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    validator: onOtpValidate,
                  ),
                  ConfirmationFormField(
                    controller: _fieldFour,
                    onChanged: onChanged,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    validator: onOtpValidate,
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
                    buttonText: StringValue.submit,
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
                    buttonText: StringValue.resentCode,
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

  String? onOtpValidate(String? value) {
    if (value?.length != 1) {
      setState(() {
        formCompleted = false;
      });
    } else {
      setState(() {
        formCompleted = true;
      });
    }
    return null;
  }
}
