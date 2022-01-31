// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) {
  return CurrencyResponse(
    source: json['source'] as String?,
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
      'source': instance.source,
      'usd': instance.usd,
      'eur': instance.eur,
    };
