// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) {
  return ResultResponse(
    currency: json['currency'] == null
        ? null
        : CurrencyResponse.fromJson(json['currency'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'currency': instance.currency,
    };
