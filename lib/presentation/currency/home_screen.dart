import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../constants/constant_images.dart';
import '../../domain/model/currency_result/currency_result.dart';
import '../../domain/model/currency_type/currency_type.dart';
import '../../domain/use_case/get_currency_use_case.dart';
import '../../generated/l10n.dart';
import 'currency_custom_text_field.dart';
import 'home_state.dart';
import 'home_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.homeStore,
    Key? key,
  }) : super(key: key);
  final HomeStore homeStore;

  static Widget create(BuildContext context) =>
      ProxyProvider<GetCurrencyUseCase, HomeStore>(
        update: (context, getCurrencyUseCase, homeStore) =>
            homeStore ??
            HomeStore(
              getCurrencyUseCase,
            ),
        child: Consumer<HomeStore>(
          builder: (context, homeStore, _) => HomeScreen(
            homeStore: homeStore,
          ),
        ),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _dollarTextEditingController;
  late TextEditingController _eurTextEditingController;
  late TextEditingController _realTextEditingController;
  late ReactionDisposer reactionDisposer;

  @override
  void initState() {
    super.initState();
    _dollarTextEditingController = TextEditingController();
    _eurTextEditingController = TextEditingController();
    _realTextEditingController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactionDisposer =
        reaction((_) => widget.homeStore.currencyResult, (currencyResult) {
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
                  onTap: () {
                    _realTextEditingController.clear();
                  },
                  prefix: S.of(context).homeScreenRealPrefixTextField,
                  labelText: S.of(context).homeScreenRealLabelTextField,
                  onChanged: (value) {
                    widget.homeStore.getCurrency(value, CurrencyType.real);
                  },
                  textEditingController: _realTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  onTap: () {
                    _dollarTextEditingController.clear();
                  },
                  prefix: S.of(context).homeScreenDollarsPrefixTextField,
                  labelText: S.of(context).homeScreenDollarsLabelTextField,
                  onChanged: (value) {
                    widget.homeStore.getCurrency(value, CurrencyType.dollar);
                  },
                  textEditingController: _dollarTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  onTap: () {
                    _eurTextEditingController.clear();
                  },
                  prefix: S.of(context).homeScreenEurosPrefixTextField,
                  labelText: S.of(context).homeScreenEurosLabelTextField,
                  onChanged: (value) {
                    widget.homeStore.getCurrency(value, CurrencyType.euro);
                  },
                  textEditingController: _eurTextEditingController,
                ),
                const SizedBox(
                  height: 35,
                ),
                Observer(
                  builder: (context) {
                    switch (widget.homeStore.homeState) {
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
                          'Valores convertidos!',
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
