import '../result/result_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'converter_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ConverterResponse {
  ConverterResponse({
    this.by,
    this.validKey,
    this.result,
    this.executionTime,
    this.fromCache,
  });

  factory ConverterResponse.fromJson(Map<String, dynamic> json) =>
      _$ConverterResponseFromJson(json);

  final String? by;
  final bool? validKey;
  final ResultResponse? result;
  final int? executionTime;
  final bool? fromCache;

  Map<String, dynamic> toJson() => _$ConverterResponseToJson(this);
}
