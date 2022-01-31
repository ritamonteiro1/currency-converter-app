import '../gbp/gbp_response.dart';
import '../usd/usd_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrencyResponse {
  CurrencyResponse({
    this.source,
    this.uSD,
    this.eUR,
    this.gBP,
    this.aRS,
    this.cAD,
    this.aUD,
    this.jPY,
    this.cNY,
    this.bTC,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseFromJson(json);

  final String? source;
  final UsdResponse? uSD;
  final UsdResponse? eUR;
  final GbpResponse? gBP;
  final GbpResponse? aRS;
  final GbpResponse? cAD;
  final GbpResponse? aUD;
  final GbpResponse? jPY;
  final GbpResponse? cNY;
  final UsdResponse? bTC;

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}
