
import 'package:currencyconverter_app/domain/model/usd/usd_model.dart';

import '../gbp/gbp_model.dart';

class CurrencyModel {
  CurrencyModel({
   required this.source,
    required this.uSD,
    required this.eUR,
    required this.gBP,
    required this.aRS,
    required this.cAD,
    required this.aUD,
    required this.jPY,
    required this.cNY,
    required this.bTC,
  });

  final String source;
  final UsdModel uSD;
  final UsdModel eUR;
  final GbpModel gBP;
  final GbpModel aRS;
  final GbpModel cAD;
  final GbpModel aUD;
  final GbpModel jPY;
  final GbpModel cNY;
  final UsdModel bTC;
}