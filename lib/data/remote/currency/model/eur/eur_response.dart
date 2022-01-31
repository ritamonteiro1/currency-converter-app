import 'package:json_annotation/json_annotation.dart';

part 'eur_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EurResponse {
  EurResponse({
    required this.buy,
  });

  factory EurResponse.fromJson(Map<String, dynamic> json) =>
      _$EurResponseFromJson(json);

  final double? buy;

  Map<String, dynamic> toJson() => _$EurResponseToJson(this);
}
