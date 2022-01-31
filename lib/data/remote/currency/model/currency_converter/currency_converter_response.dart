
import '../result/result_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_converter_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrencyConverterResponse {
  CurrencyConverterResponse({
    required this.by,
    required this.validKey,
    required this.result,
    required this.executionTime,
    required this.fromCache,
  });

  factory CurrencyConverterResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyConverterResponseFromJson(json);

  final String? by;
  final bool? validKey;
  final ResultResponse? result;
  final double? executionTime;
  final bool? fromCache;

  Map<String, dynamic> toJson() => _$CurrencyConverterResponseToJson(this);

}
