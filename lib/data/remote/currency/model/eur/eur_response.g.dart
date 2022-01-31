// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eur_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EurResponse _$EurResponseFromJson(Map<String, dynamic> json) {
  return EurResponse(
    name: json['name'] as String?,
    buy: (json['buy'] as num?)?.toDouble(),
    sell: (json['sell'] as num?)?.toDouble(),
    variation: (json['variation'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$EurResponseToJson(EurResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'buy': instance.buy,
      'sell': instance.sell,
      'variation': instance.variation,
    };
