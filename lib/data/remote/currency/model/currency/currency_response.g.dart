// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) =>
    CurrencyResponse(
      usd: json['USD'] == null
          ? null
          : UsdResponse.fromJson(json['USD'] as Map<String, dynamic>),
      eur: json['EUR'] == null
          ? null
          : EurResponse.fromJson(json['EUR'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{
      'USD': instance.usd,
      'EUR': instance.eur,
    };
