import '../../domain/model/currency_result/currency_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../constants/constant_images.dart';
import '../../data/remote/currency/data_source/currency_remote_data_source.dart';
import '../../data/remote/currency/data_source/currency_remote_data_source_impl.dart';
import '../../domain/model/currency_type/currency_type.dart';
import '../../domain/repository/currency/currency_repository.dart';
import '../../domain/repository/currency/currency_repository_impl.dart';
import '../../domain/use_case/get_currency_use_case.dart';
import '../../domain/use_case/get_currency_use_case_impl.dart';
import '../../generated/l10n.dart';
import 'currency_custom_text_field.dart';
import 'home_state.dart';
import 'home_store.dart';

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
  late GetCurrencyUseCase getCurrencyUseCase;
  late HomeStore homeStore;
  late ReactionDisposer reactionDisposer;

  @override
  void initState() {
    super.initState();
    _dollarTextEditingController = TextEditingController();
    _eurTextEditingController = TextEditingController();
    _realTextEditingController = TextEditingController();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    currencyRemoteDataSource = CurrencyRemoteDataSourceImpl(dio);
    currencyRepository = CurrencyRepositoryImpl(currencyRemoteDataSource);
    getCurrencyUseCase = GetCurrencyUseCaseImpl(currencyRepository);
    homeStore = HomeStore(getCurrencyUseCase);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactionDisposer =
        reaction((_) => homeStore.currencyResult, (currencyResult) {
      if (currencyResult != null && currencyResult is CurrencyResult) {
        _realTextEditingController.text =
            currencyResult.real.toStringAsFixed(2);
        _dollarTextEditingController.text =
            currencyResult.dollar.toStringAsFixed(2);
        _eurTextEditingController.text = currencyResult.eur.toStringAsFixed(2);
      }
    });
  }

  @override
  void dispose() {
    _dollarTextEditingController.dispose();
    _eurTextEditingController.dispose();
    _realTextEditingController.dispose();
    reactionDisposer();
    super.dispose();
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 38,
              vertical: 50,
            ),
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
                  onChanged: (value) {
                    homeStore.getCurrency(value, CurrencyType.real);
                  },
                  textEditingController: _realTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenDollarsPrefixTextField,
                  labelText: S.of(context).homeScreenDollarsLabelTextField,
                  onChanged: (value) {
                    homeStore.getCurrency(value, CurrencyType.dollar);
                  },
                  textEditingController: _dollarTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  prefix: S.of(context).homeScreenEurosPrefixTextField,
                  labelText: S.of(context).homeScreenEurosLabelTextField,
                  onChanged: (value) {
                    homeStore.getCurrency(value, CurrencyType.euro);
                  },
                  textEditingController: _eurTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                Observer(
                  builder: (context) {
                    switch (homeStore.homeState) {
                      case HomeState.initial:
                        return const Text(
                          'Digite o valor!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      case HomeState.loading:
                        return Container(
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case HomeState.occurredGenericError:
                        return const Text(
                          'Ocorreu um erro. Tente novamente',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      case HomeState.occurredNetworkError:
                        return const Text(
                          'Falha na conexão. Tente novamente',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      case HomeState.success:
                        return const Text(
                          'Sucesso na requisição',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
