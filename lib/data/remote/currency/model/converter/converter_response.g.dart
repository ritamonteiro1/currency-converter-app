// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConverterResponse _$ConverterResponseFromJson(Map<String, dynamic> json) {
  return ConverterResponse(
    by: json['by'] as String?,
    validKey: json['valid_key'] as bool?,
    result: json['result'] == null
        ? null
        : ResultResponse.fromJson(json['result'] as Map<String, dynamic>),
    executionTime: json['execution_time'] as int?,
    fromCache: json['from_cache'] as bool?,
  );
}

Map<String, dynamic> _$ConverterResponseToJson(ConverterResponse instance) =>
    <String, dynamic>{
      'by': instance.by,
      'valid_key': instance.validKey,
      'result': instance.result,
      'execution_time': instance.executionTime,
      'from_cache': instance.fromCache,
    };
