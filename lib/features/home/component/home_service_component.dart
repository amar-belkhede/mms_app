import '../../../core/model/investment_and_service.dart';
import '../../common_import.dart';

class HomeServiceComponent extends StatelessWidget {
  HomeServiceComponent({
    required this.serviceList,
    super.key,
  });

  final List<Service> serviceList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Service',
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(serviceList.length, (index) {
              return Card(
                shadowColor: const Color.fromARGB(255, 241, 241, 241),
                elevation: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        serviceTypeToIcons[serviceList[index].type]?.icon,
                        color: AppColors.mmsIndigo,
                        size: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${serviceTypeToIcons[serviceList[index].type]?.type}',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Map<ServiceType, ServiceIcon> serviceTypeToIcons = {
    ServiceType.fund: ServiceIcon(type: 'Fund', icon: Icons.monetization_on),
    ServiceType.sendmoney:
        ServiceIcon(type: 'Send Money', icon: Icons.mobile_friendly_sharp),
    ServiceType.bankTransfer:
        ServiceIcon(type: 'Bank Transfer', icon: Icons.other_houses_sharp),
    ServiceType.loanrequest:
        ServiceIcon(type: 'Loan Request', icon: Icons.handshake_rounded),
    ServiceType.airtime:
        ServiceIcon(type: 'Airtime', icon: Icons.textsms_outlined),
    ServiceType.cards: ServiceIcon(type: 'Cards', icon: Icons.credit_card),
  };
}

class ServiceIcon {
  ServiceIcon({required this.type, required this.icon});

  String type;
  IconData icon;
}
