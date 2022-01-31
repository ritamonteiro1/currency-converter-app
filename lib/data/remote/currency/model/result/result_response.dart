import '../currency/currency_response.dart';
import '../stocks/stocks_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultResponse {
  ResultResponse({
    this.currency,
    this.stocks,
    this.availableSources,
  });

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);

  final CurrencyResponse? currency;
  final StocksResponse? stocks;
  final List<String>? availableSources;

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}
