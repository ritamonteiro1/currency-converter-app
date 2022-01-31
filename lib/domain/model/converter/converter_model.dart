import '../result/result_model.dart';

class ConverterModel {
  ConverterModel({
    required this.by,
    required this.validKey,
    required this.result,
    required this.executionTime,
    required this.fromCache,
  });

  final String by;
  final bool validKey;
  final ResultModel result;
  final int executionTime;
  final bool fromCache;
}
