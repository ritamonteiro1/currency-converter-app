// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gbp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GbpResponse _$GbpResponseFromJson(Map<String, dynamic> json) {
  return GbpResponse(
    name: json['name'] as String?,
    buy: (json['buy'] as num?)?.toDouble(),
    variation: (json['variation'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$GbpResponseToJson(GbpResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'buy': instance.buy,
      'variation': instance.variation,
    };
