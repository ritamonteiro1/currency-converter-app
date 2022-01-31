import '../ibovespa/ibovespa_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stocks_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StocksResponse {
  StocksResponse({
    this.ibovespa,
    this.ifix,
    this.nasdaq,
    this.dowjones,
    this.cac,
    this.nikkei,
  });

  factory StocksResponse.fromJson(Map<String, dynamic> json) =>
      _$StocksResponseFromJson(json);

  final IbovespaResponse? ibovespa;
  final IbovespaResponse? ifix;
  final IbovespaResponse? nasdaq;
  final IbovespaResponse? dowjones;
  final IbovespaResponse? cac;
  final IbovespaResponse? nikkei;

  Map<String, dynamic> toJson() => _$StocksResponseToJson(this);
}
