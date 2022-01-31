// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) {
  return CurrencyResponse(
    usd: json['usd'] == null
        ? null
        : UsdResponse.fromJson(json['usd'] as Map<String, dynamic>),
    eur: json['eur'] == null
        ? null
        : EurResponse.fromJson(json['eur'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{
      'usd': instance.usd,
      'eur': instance.eur,
    };
