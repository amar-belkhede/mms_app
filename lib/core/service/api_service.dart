import '../model/investment_and_service.dart';
import 'api_service_provider.dart';

abstract class ApiService {
  factory ApiService() => ApiServiceProvider();

  Future<InvestmentAndService> getAssetsAndServices();
}
