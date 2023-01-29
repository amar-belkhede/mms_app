import '../common_import.dart';

class MmsButton extends StatelessWidget {
  const MmsButton({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.backgroundColor,
    this.fontSize,
    this.onPressed,
  });

  final String buttonText;
  final Color textColor;
  final Color backgroundColor;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize:
              fontSize ?? Theme.of(context).textTheme.labelLarge?.fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
