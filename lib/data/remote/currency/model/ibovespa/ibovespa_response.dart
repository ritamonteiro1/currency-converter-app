import 'package:json_annotation/json_annotation.dart';
part 'ibovespa_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IbovespaResponse {
  IbovespaResponse({
    this.name,
    this.location,
    this.points,
    this.variation,
  });

  factory IbovespaResponse.fromJson(Map<String, dynamic> json) =>
      _$IbovespaResponseFromJson(json);

  final String? name;
  final String? location;
  final double? points;
  final double? variation;

  Map<String, dynamic> toJson() => _$IbovespaResponseToJson(this);
}
