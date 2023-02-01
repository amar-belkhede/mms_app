import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../util/string_value.dart';
import '../bloc/auth_bloc.dart';
import '../../common/custom_form_field.dart';
import '../../common/mms_text_button.dart';
import '../../common/signup_form_field.dart';
import '../../common_import.dart';
import '../../../util/string_ext.dart';
import '../confirmation/otp_verification_page.dart';

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
            hintText: StringValue.firstName,
            validator: (value) {
              if (value != null && !value.isValidName) {
                return StringValue.enterValidFirstName;
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: StringValue.middleName,
            validator: (value) {
              if (value != null && !value.isValidName) {
                return StringValue.enterValidMiddleName;
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: StringValue.lastName,
            validator: (value) {
              if (value != null && !value.isValidName) {
                return StringValue.enterValidLastName;
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: StringValue.dateOfBirth,
          ),
          SignupFormfield(
            hintText: StringValue.confirmPassword,
            obscureText: true,
            validator: (value) {
              if (value != null && !value.isValidPassword) {
                return StringValue.passwordValidationError;
              }
              return null;
            },
          ),
          SignupFormfield(
            hintText: StringValue.phoneNumber,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value != null && !value.isValidPhone) {
                return StringValue.phoneNumberValidationError;
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  hintText: StringValue.gender,
                  border: OutlineInputBorder(),
                ),
                items: gender
                    .map((String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                }),
          ),
          MmsButton(
            buttonText: StringValue.createAccount,
            textColor: Colors.white,
            backgroundColor: AppColors.mmsIndigo,
            onPressed: () {
              if (widget._formKey.currentState!.validate()) {
                // context.push(OtpVerificationPage.path);
                AuthBloc.of(context).add(UserRegisteredEvent());
              }
            },
          ),
        ],
      ),
    );
  }
}

List<String> gender = ['Male', 'Female', 'Trans Gender'];
