import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../common/custom_form_field.dart';
import '../common/mms_text_button.dart';
import '../common/signup_form_field.dart';
import '../common_import.dart';
import '../../util/string_ext.dart';
import '../confirmation/confirmation_page.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String dropdownValue = gender.first;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SignupFormfield(
            hintText: 'First Name',
            validator: (value) {
              if (value != null && !value.isValidName) {
                return 'Enter valid first name';
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: 'Middle Name',
            validator: (value) {
              if (value != null && !value.isValidName) {
                return 'Enter valid middle name';
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: 'Last Name',
            validator: (value) {
              if (value != null && !value.isValidName) {
                return 'Enter valid last name';
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: 'Date of Birth',
          ),
          SignupFormfield(
            hintText: 'Confirm password',
            obscureText: true,
            validator: (value) {
              if (value != null && !value.isValidPassword) {
                return 'Enter valid password name, min 8 char, with special char, number, alpha';
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: 'Phone Number',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value != null && !value.isValidPhone) {
                return 'Enter valid phone name, should contain 10 digit';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  hintText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                items: gender
                    .map((String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                }),
          ),
          MmsButton(
            buttonText: 'Create Account',
            textColor: Colors.white,
            backgroundColor: AppColors.mmsIndigo,
            onPressed: () {
              if (widget._formKey.currentState!.validate()) {
                context.push(ConfirmationPage.path);
              }
            },
          ),
        ],
      ),
    );
  }
}

List<String> gender = ['Male', 'Female', 'Trans Gender'];
