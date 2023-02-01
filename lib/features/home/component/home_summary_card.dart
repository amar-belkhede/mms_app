import '../../../core/model/investment_and_service.dart';
import '../../../util/string_value.dart';
import '../../common/mms_text_button.dart';
import '../../common_import.dart';

class HomeSummaryCard extends StatelessWidget {
  const HomeSummaryCard({
    super.key,
    required this.investment,
    required this.index,
  });

  final int index;
  final Investment investment;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width - 100,
      margin: EdgeInsets.only(
        left: (index == 0) ? 20 : 0,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mmsIndigo,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              investment.type!.name,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.lightGrey,
                  ),
            ),
            Text(
              '\$ ${investment.amount}',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: AppColors.lightGrey),
            ),
            const SizedBox(
              height: 30,
            ),
            MmsButton(
              buttonText: StringValue.withdrawFunds,
              fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
              textColor: Colors.white,
              backgroundColor: AppColors.sandyColor,
            )
          ],
        ),
      ),
    );
  }
}
