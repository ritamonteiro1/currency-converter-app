import '../../model/currency/currency_model.dart';

import 'currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  CurrencyRepositoryImpl(
    this.currencyRepository,
  );

  final CurrencyRepository currencyRepository;

  @override
  Future<CurrencyModel> getCurrency() => currencyRepository.getCurrency();
}
