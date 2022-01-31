// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usd_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsdResponse _$UsdResponseFromJson(Map<String, dynamic> json) {
  return UsdResponse(
    name: json['name'] as String?,
    buy: (json['buy'] as num?)?.toDouble(),
    sell: (json['sell'] as num?)?.toDouble(),
    variation: (json['variation'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$UsdResponseToJson(UsdResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'buy': instance.buy,
      'sell': instance.sell,
      'variation': instance.variation,
    };
