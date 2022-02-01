// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) {
  return CurrencyResponse(
    source: json['source'] as String,
    USD: json['USD'] == null
        ? null
        : UsdResponse.fromJson(json['USD'] as Map<String, dynamic>),
    EUR: json['EUR'] == null
        ? null
        : EurResponse.fromJson(json['EUR'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{
      'USD': instance.USD,
      'EUR': instance.EUR,
      'source': instance.source,
    };
