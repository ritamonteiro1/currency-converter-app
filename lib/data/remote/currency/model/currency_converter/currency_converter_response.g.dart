// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_converter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyConverterResponse _$CurrencyConverterResponseFromJson(
    Map<String, dynamic> json) {
  return CurrencyConverterResponse(
    by: json['by'] as String?,
    validKey: json['valid_key'] as bool?,
    result: json['result'] == null
        ? null
        : ResultResponse.fromJson(json['result'] as Map<String, dynamic>),
    executionTime: (json['execution_time'] as num?)?.toDouble(),
    fromCache: json['from_cache'] as bool?,
  );
}

Map<String, dynamic> _$CurrencyConverterResponseToJson(
        CurrencyConverterResponse instance) =>
    <String, dynamic>{
      'by': instance.by,
      'valid_key': instance.validKey,
      'result': instance.result,
      'execution_time': instance.executionTime,
      'from_cache': instance.fromCache,
    };
