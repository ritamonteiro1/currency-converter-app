// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_converter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyConverterResponse _$CurrencyConverterResponseFromJson(
    Map<String, dynamic> json) {
  return CurrencyConverterResponse(
    result: json['result'] == null
        ? null
        : ResultResponse.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrencyConverterResponseToJson(
        CurrencyConverterResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
