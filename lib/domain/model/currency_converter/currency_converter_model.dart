
import '../result/result_model.dart';

class CurrencyConverterModel {
  CurrencyConverterModel({
    required this.by,
    required this.validKey,
    required this.result,
    required this.executionTime,
    required this.fromCache,
  });

  final String? by;
  final bool? validKey;
  final ResultModel? result;
  final double? executionTime;
  final bool? fromCache;
}
