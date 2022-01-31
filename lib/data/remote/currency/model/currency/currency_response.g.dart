// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) {
  return CurrencyResponse(
    source: json['source'] as String?,
    uSD: json['u_s_d'] == null
        ? null
        : UsdResponse.fromJson(json['u_s_d'] as Map<String, dynamic>),
    eUR: json['e_u_r'] == null
        ? null
        : UsdResponse.fromJson(json['e_u_r'] as Map<String, dynamic>),
    gBP: json['g_b_p'] == null
        ? null
        : GbpResponse.fromJson(json['g_b_p'] as Map<String, dynamic>),
    aRS: json['a_r_s'] == null
        ? null
        : GbpResponse.fromJson(json['a_r_s'] as Map<String, dynamic>),
    cAD: json['c_a_d'] == null
        ? null
        : GbpResponse.fromJson(json['c_a_d'] as Map<String, dynamic>),
    aUD: json['a_u_d'] == null
        ? null
        : GbpResponse.fromJson(json['a_u_d'] as Map<String, dynamic>),
    jPY: json['j_p_y'] == null
        ? null
        : GbpResponse.fromJson(json['j_p_y'] as Map<String, dynamic>),
    cNY: json['c_n_y'] == null
        ? null
        : GbpResponse.fromJson(json['c_n_y'] as Map<String, dynamic>),
    bTC: json['b_t_c'] == null
        ? null
        : UsdResponse.fromJson(json['b_t_c'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{
      'source': instance.source,
      'u_s_d': instance.uSD,
      'e_u_r': instance.eUR,
      'g_b_p': instance.gBP,
      'a_r_s': instance.aRS,
      'c_a_d': instance.cAD,
      'a_u_d': instance.aUD,
      'j_p_y': instance.jPY,
      'c_n_y': instance.cNY,
      'b_t_c': instance.bTC,
    };
