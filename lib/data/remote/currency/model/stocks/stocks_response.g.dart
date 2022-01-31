// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StocksResponse _$StocksResponseFromJson(Map<String, dynamic> json) {
  return StocksResponse(
    ibovespa: json['ibovespa'] == null
        ? null
        : IbovespaResponse.fromJson(json['ibovespa'] as Map<String, dynamic>),
    ifix: json['ifix'] == null
        ? null
        : IbovespaResponse.fromJson(json['ifix'] as Map<String, dynamic>),
    nasdaq: json['nasdaq'] == null
        ? null
        : IbovespaResponse.fromJson(json['nasdaq'] as Map<String, dynamic>),
    dowjones: json['dowjones'] == null
        ? null
        : IbovespaResponse.fromJson(json['dowjones'] as Map<String, dynamic>),
    cac: json['cac'] == null
        ? null
        : IbovespaResponse.fromJson(json['cac'] as Map<String, dynamic>),
    nikkei: json['nikkei'] == null
        ? null
        : IbovespaResponse.fromJson(json['nikkei'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StocksResponseToJson(StocksResponse instance) =>
    <String, dynamic>{
      'ibovespa': instance.ibovespa,
      'ifix': instance.ifix,
      'nasdaq': instance.nasdaq,
      'dowjones': instance.dowjones,
      'cac': instance.cac,
      'nikkei': instance.nikkei,
    };
