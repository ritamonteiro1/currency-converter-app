import 'package:json_annotation/json_annotation.dart';

part 'eur_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EurResponse {
  EurResponse({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  factory EurResponse.fromJson(Map<String, dynamic> json) =>
      _$EurResponseFromJson(json);

  final String? name;
  final double? buy;
  final double? sell;
  final double? variation;

  Map<String, dynamic> toJson() => _$EurResponseToJson(this);
}
