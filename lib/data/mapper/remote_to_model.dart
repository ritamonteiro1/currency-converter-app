import '../../domain/model/currency/currency_model.dart';
import '../remote/currency/model/currency/currency_response.dart';

extension CurrencyResponseToCurrencyModel on CurrencyResponse {
  static const doubleForNullResponse = -1.0;

  CurrencyModel toCurrencyModel() => CurrencyModel(
        dollarInReal: USD?.buy ?? doubleForNullResponse,
        euroInReal: EUR?.buy ?? doubleForNullResponse,
      );
}
