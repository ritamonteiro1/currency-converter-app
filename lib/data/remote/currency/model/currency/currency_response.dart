import 'package:json_annotation/json_annotation.dart';

import '../eur/eur_response.dart';
import '../usd/usd_response.dart';

part 'currency_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrencyResponse {
  CurrencyResponse({
    required this.USD,
    required this.EUR,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseFromJson(json);

  final UsdResponse? USD;
  final EurResponse? EUR;

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}
