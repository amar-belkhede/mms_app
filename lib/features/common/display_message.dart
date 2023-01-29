import '../common_import.dart';

class DisplayMessage extends StatelessWidget {
  const DisplayMessage({
    super.key,
    this.message,
    this.showProgressIndicator = false,
  });

  final String? message;
  final bool showProgressIndicator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showProgressIndicator) CircularProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          Text(message ?? ''),
        ],
      ),
    );
  }
}
