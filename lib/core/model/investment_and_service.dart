import 'package:json_annotation/json_annotation.dart';

part 'investment_and_service.g.dart';

enum InvestmentType {
  wallet,
  loan,
  investmentAccount,
}

enum ServiceType {
  fund,
  sendmoney,
  bankTransfer,
  loanrequest,
  airtime,
  cards,
}

@JsonSerializable(explicitToJson: true)
class Investment {
  Investment({
    this.type,
    this.amount,
  });

  factory Investment.fromJson(Map<String, dynamic> json) =>
      _$InvestmentFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentToJson(this);

  @JsonKey(name: 'type', includeIfNull: false)
  InvestmentType? type;

  @JsonKey(name: 'amount', includeIfNull: false)
  String? amount;
}

@JsonSerializable(explicitToJson: true)
class Service {
  Service({this.type});

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  @JsonKey(name: 'name', includeIfNull: false)
  ServiceType? type;
}

@JsonSerializable(explicitToJson: true)
class InvestmentAndService {
  InvestmentAndService({this.investmentList, this.serviceList});

  factory InvestmentAndService.fromJson(Map<String, dynamic> json) =>
      _$InvestmentAndServiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentAndServiceToJson(this);

  @JsonKey(name: 'investmentList', includeIfNull: false)
  List<Investment>? investmentList;

  @JsonKey(name: 'serviceList', includeIfNull: false)
  List<Service>? serviceList;
}
