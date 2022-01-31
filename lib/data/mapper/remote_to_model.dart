import '../../domain/model/currency/currency_model.dart';
import '../../domain/model/eur/eur_model.dart';
import '../../domain/model/usd/usd_model.dart';
import '../remote/currency/model/currency/currency_response.dart';

extension CurrencyResponseToCurrencyModel on CurrencyResponse {
  static const doubleForNullResponse = -1.0;

  CurrencyModel toCurrencyModel() => CurrencyModel(
        usd: UsdModel(buy: usd?.buy ?? doubleForNullResponse),
        eur: EurModel(buy: eur?.buy ?? doubleForNullResponse),
      );
}
