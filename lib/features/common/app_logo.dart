import '../common_import.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Global',
            style: GoogleFonts.russoOne(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              color: AppColors.mmsIndigo,
            ),
          ),
          Text(
            'Finance',
            style: GoogleFonts.coda(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              color: AppColors.mmsIndigo,
            ),
          ),
        ],
      ),
    );
  }
}
