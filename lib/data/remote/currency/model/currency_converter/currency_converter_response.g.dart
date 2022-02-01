// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_converter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyConverterResponse _$CurrencyConverterResponseFromJson(
    Map<String, dynamic> json) {
  return CurrencyConverterResponse(
    results: json['results'] == null
        ? null
        : ResultResponse.fromJson(json['results'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrencyConverterResponseToJson(
        CurrencyConverterResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
