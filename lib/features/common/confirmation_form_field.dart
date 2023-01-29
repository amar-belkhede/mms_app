import '../common_import.dart';
import 'custom_form_field.dart';

class ConfirmationFormField extends StatelessWidget {
  const ConfirmationFormField({
    super.key,
    this.height = 60,
    this.width = 50,
    this.controller,
    this.autofocus = false,
    this.keyboardType: TextInputType.number,
    this.onChanged,
    this.textAlign = TextAlign.center,
    this.validator,
  });

  final int height;
  final int width;
  final bool autofocus;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      margin: const EdgeInsets.only(right: 10),
      child: CustomFormField(
        controller: controller,
        autofocus: true,
        textAlign: textAlign,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
