import '../result/result_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_converter_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrencyConverterResponse {
  CurrencyConverterResponse({
    required this.results,
  });

  factory CurrencyConverterResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyConverterResponseFromJson(json);

  final ResultResponse? results;

  Map<String, dynamic> toJson() => _$CurrencyConverterResponseToJson(this);
}
