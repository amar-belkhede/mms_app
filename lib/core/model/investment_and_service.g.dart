// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_and_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Investment _$InvestmentFromJson(Map<String, dynamic> json) => Investment(
      type: $enumDecodeNullable(_$InvestmentTypeEnumMap, json['type']),
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$InvestmentToJson(Investment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$InvestmentTypeEnumMap[instance.type]);
  writeNotNull('amount', instance.amount);
  return val;
}

const _$InvestmentTypeEnumMap = {
  InvestmentType.wallet: 'wallet',
  InvestmentType.loan: 'loan',
  InvestmentType.investmentAccount: 'investmentAccount',
};

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      type: $enumDecodeNullable(_$ServiceTypeEnumMap, json['name']),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$ServiceTypeEnumMap[instance.type]);
  return val;
}

const _$ServiceTypeEnumMap = {
  ServiceType.fund: 'fund',
  ServiceType.sendmoney: 'sendmoney',
  ServiceType.bankTransfer: 'bankTransfer',
  ServiceType.loanrequest: 'loanrequest',
  ServiceType.airtime: 'airtime',
  ServiceType.cards: 'cards',
};

InvestmentAndService _$InvestmentAndServiceFromJson(
        Map<String, dynamic> json) =>
    InvestmentAndService(
      investmentList: (json['investmentList'] as List<dynamic>?)
          ?.map((e) => Investment.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceList: (json['serviceList'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvestmentAndServiceToJson(
    InvestmentAndService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('investmentList',
      instance.investmentList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'serviceList', instance.serviceList?.map((e) => e.toJson()).toList());
  return val;
}
