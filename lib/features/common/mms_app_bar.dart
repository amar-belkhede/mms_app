import 'package:go_router/go_router.dart';
import '../common_import.dart';

AppBar mmsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppColors.mmsIndigo,
    ),
    leading: GestureDetector(
      child: const Icon(
        Icons.arrow_back_ios,
      ),
      onTap: () {
        context.pop();
      },
    ),
  );
}
