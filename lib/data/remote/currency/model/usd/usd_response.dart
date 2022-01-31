import 'package:json_annotation/json_annotation.dart';

part 'usd_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UsdResponse {
  UsdResponse({
    this.name,
    this.buy,
    this.sell,
    this.variation,
  });

  factory UsdResponse.fromJson(Map<String, dynamic> json) =>
      _$UsdResponseFromJson(json);

  final String? name;
  final double? buy;
  final double? sell;
  final double? variation;

  Map<String, dynamic> toJson() => _$UsdResponseToJson(this);
}
