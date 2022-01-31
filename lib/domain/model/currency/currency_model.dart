import '../eur/eur_model.dart';
import '../usd/usd_model.dart';

class CurrencyModel {
  CurrencyModel({
    required this.usd,
    required this.eur,
  });

  final UsdModel usd;
  final EurModel eur;
}
