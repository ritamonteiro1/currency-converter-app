import '../../../data/remote/currency/data_source/currency_remote_data_source.dart';

import '../../model/currency/currency_model.dart';
import 'currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  CurrencyRepositoryImpl(
    this.currencyRemoteDataSource,
  );

  final CurrencyRemoteDataSource currencyRemoteDataSource;

  @override
  Future<CurrencyModel> getCurrency() => currencyRemoteDataSource.getCurrency();
}
