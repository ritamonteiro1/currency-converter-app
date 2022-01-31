import '../currency/currency_model.dart';

class ResultModel {
  ResultModel({
    required this.currencies,
    required this.taxes,
  });
  final CurrencyModel? currencies;
  final dynamic taxes;
}
