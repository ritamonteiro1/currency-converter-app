import 'package:json_annotation/json_annotation.dart';

import '../eur/eur_response.dart';
import '../usd/usd_response.dart';

part 'currency_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrencyResponse {
  CurrencyResponse({
    required this.usd,
    required this.eur,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseFromJson(json);

  final UsdResponse? usd;
  final EurResponse? eur;

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}
