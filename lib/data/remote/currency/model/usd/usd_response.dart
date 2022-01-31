import 'package:json_annotation/json_annotation.dart';

part 'usd_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UsdResponse {
  UsdResponse({
    required this.buy,
  });

  factory UsdResponse.fromJson(Map<String, dynamic> json) =>
      _$UsdResponseFromJson(json);

  final double? buy;

  Map<String, dynamic> toJson() => _$UsdResponseToJson(this);
}
