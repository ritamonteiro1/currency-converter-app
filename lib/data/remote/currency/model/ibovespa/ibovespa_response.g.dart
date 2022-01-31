// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ibovespa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IbovespaResponse _$IbovespaResponseFromJson(Map<String, dynamic> json) {
  return IbovespaResponse(
    name: json['name'] as String?,
    location: json['location'] as String?,
    points: (json['points'] as num?)?.toDouble(),
    variation: (json['variation'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$IbovespaResponseToJson(IbovespaResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'points': instance.points,
      'variation': instance.variation,
    };
