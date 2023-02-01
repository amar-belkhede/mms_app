import '../model/investment_and_service.dart';
import 'api_service.dart';

class ApiServiceProvider implements ApiService {
  @override
  Future<InvestmentAndService> getAssetsAndServices() async {
    Map<String, dynamic> response = {
      'investmentList': [
        {'type': 'wallet', 'amount': '540,781'},
        {'type': 'loan', 'amount': '240,053'},
        {'type': 'investmentAccount', 'amount': '910,902'}
      ],
      'serviceList': [
        {'name': 'fund'},
        {'name': 'sendmoney'},
        {'name': 'bankTransfer'},
        {'name': 'loanrequest'},
        {'name': 'airtime'},
        {'name': 'cards'}
      ]
    };

    await Future.delayed(const Duration(seconds: 2));

    return InvestmentAndService.fromJson(response);
  }
}
