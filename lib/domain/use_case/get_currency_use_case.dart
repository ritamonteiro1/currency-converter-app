import 'package:currencyconverter_app/domain/model/currency_type/currency_type.dart';

import '../model/currency/currency_model.dart';
import '../repository/currency/currency_repository.dart';
import 'get_currency_use_case_impl.dart';

class GetCurrencyUseCaseImpl implements GetCurrencyUseCase {
  GetCurrencyUseCaseImpl(
    this.currencyRepository,
  );

  final CurrencyRepository currencyRepository;

  @override
  Future<CurrencyModel> getCurrency(
    double value,
    CurrencyType from,
    CurrencyType to,
  ) =>
      currencyRepository.getCurrency(
        value,
        from,
        to,
      );
}
