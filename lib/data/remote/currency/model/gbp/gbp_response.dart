import 'package:json_annotation/json_annotation.dart';

part 'gbp_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GbpResponse {
  GbpResponse({
    this.name,
    this.buy,
    this.variation,
  });

  factory GbpResponse.fromJson(Map<String, dynamic> json) =>
      _$GbpResponseFromJson(json);

  final String? name;
  final double? buy;
  final double? variation;

  Map<String, dynamic> toJson() => _$GbpResponseToJson(this);
}
