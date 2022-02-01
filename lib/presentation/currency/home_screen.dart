import 'package:currencyconverter_app/domain/model/currency_result/currency_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../data/remote/currency/data_source/currency_remote_data_source.dart';
import '../../data/remote/currency/data_source/currency_remote_data_source_impl.dart';
import '../../domain/model/currency/currency_model.dart';
import '../../domain/model/currency_type/currency_type.dart';
import '../../domain/repository/currency/currency_repository.dart';
import '../../domain/repository/currency/currency_repository_impl.dart';
import '../../domain/use_case/get_currency_use_case_impl.dart';
import '../../generated/l10n.dart';
import 'currency_custom_text_field.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _dollarTextEditingController;
  late TextEditingController _eurTextEditingController;
  late TextEditingController _realTextEditingController;

  late CurrencyRemoteDataSource currencyRemoteDataSource;
  late CurrencyRepository currencyRepository;
  late GetCurrencyUseCaseImpl getCurrencyUseCase;
  late HomeController homeController;
  late CurrencyModel currencyModel;

  @override
  void initState() {
    super.initState();
    _dollarTextEditingController = TextEditingController();
    _eurTextEditingController = TextEditingController();
    _realTextEditingController = TextEditingController();
    _realTextEditingController.addListener(() {
      if (_realTextEditingController.text.isNotEmpty) {
        getCurrency(
          double.parse(_realTextEditingController.text),
          CurrencyType.real,
        );
      }
    });
    currencyRemoteDataSource = CurrencyRemoteDataSourceImpl(Dio());
    currencyRepository = CurrencyRepositoryImpl(currencyRemoteDataSource);
    getCurrencyUseCase = GetCurrencyUseCaseImpl(currencyRepository);
    homeController = HomeController(getCurrencyUseCase);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getCurrency(
    double typedValue,
    CurrencyType currencyType,
  ) async {
    final currencyResult =
        await homeController.getCurrency(typedValue, currencyType);
    setCurrencies(currencyResult);
  }

  void setCurrencies(CurrencyResult currencyResult) {
    _dollarTextEditingController.text =
        currencyResult.dollar.toStringAsFixed(2);
    _eurTextEditingController.text = currencyResult.eur.toStringAsFixed(2);
    _realTextEditingController.text = currencyResult.real.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(S.of(context).homeScreenCurrencyConverterText),
          leading: const Image(
            image: AssetImage(
              ConstantImages.logoIoasys,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 38,
            vertical: 50,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    ConstantImages.currencyConverter,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenRealPrefixTextField,
                  labelText: S.of(context).homeScreenRealLabelTextField,
                  onChanged: (value) => getCurrency(value, CurrencyType.real),
                  textEditingController: _realTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenDollarsPrefixTextField,
                  labelText: S.of(context).homeScreenDollarsLabelTextField,
                  onChanged: (value) => getCurrency(value, CurrencyType.dollar),
                  textEditingController: _dollarTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenEurosPrefixTextField,
                  labelText: S.of(context).homeScreenEurosLabelTextField,
                  onChanged: (value) => getCurrency(value, CurrencyType.euro),
                  textEditingController: _eurTextEditingController,
                ),
              ],
            ),
          ),
        ),
      );
}
