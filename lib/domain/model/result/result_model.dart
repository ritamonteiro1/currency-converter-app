import '../stocks/stocks_model.dart';

import '../currency/currency_model.dart';

class ResultModel {
  ResultModel({
    required this.currency,
    required this.stocks,
    required this.availableSources,
  });

  final CurrencyModel currency;
  final StocksModel stocks;
  final List<String> availableSources;
}
