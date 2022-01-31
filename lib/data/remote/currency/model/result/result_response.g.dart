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
    stocks: json['stocks'] == null
        ? null
        : StocksResponse.fromJson(json['stocks'] as Map<String, dynamic>),
    availableSources: (json['available_sources'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'stocks': instance.stocks,
      'available_sources': instance.availableSources,
    };
