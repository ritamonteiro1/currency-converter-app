// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) {
  return ResultResponse(
    currencies: json['currencies'] == null
        ? null
        : CurrencyResponse.fromJson(json['currencies'] as Map<String, dynamic>),
    taxes: json['taxes'],
  );
}

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'currencies': instance.currencies,
      'taxes': instance.taxes,
    };
