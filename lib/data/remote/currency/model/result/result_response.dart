

import '../currency/currency_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultResponse {
  ResultResponse({
    required this.currencies,
    required this.taxes,
  });

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);

  final CurrencyResponse? currencies;
  final dynamic taxes;
  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);

}
