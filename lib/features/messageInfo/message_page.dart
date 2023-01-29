import 'package:go_router/go_router.dart';

import '../common/mms_app_bar.dart';
import '../common/mms_text_button.dart';
import '../common_import.dart';
import '../home/home_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  static const String name = 'message';
  static const String path = '/message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mmsAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Account Created',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Congratulations. Your account has been created',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Please click on the "Continue" button to \n get into the app and start taking charge of your finances',
                ),
                const SizedBox(
                  height: 50,
                ),
                MmsButton(
                  buttonText: 'Continue',
                  textColor: Colors.white,
                  backgroundColor: AppColors.mmsIndigo,
                  onPressed: () {
                    context.push(HomePage.path);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
