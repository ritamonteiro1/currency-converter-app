import '../repository/currency/currency_repository.dart';

import '../model/currency/currency_model.dart';
import 'get_currency_use_case_impl.dart';

class GetCurrencyUseCaseImpl implements GetCurrencyUseCase {
  GetCurrencyUseCaseImpl(
    this.currencyRepository,
  );

  final CurrencyRepository currencyRepository;

  @override
  Future<CurrencyModel> getCurrency() => currencyRepository.getCurrency();
}
