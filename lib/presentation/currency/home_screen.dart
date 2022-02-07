import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../constants/constant_images.dart';
import '../../domain/model/currency_type/currency_type.dart';
import '../../domain/use_case/get_currency_use_case.dart';
import '../../generated/l10n.dart';
import 'currency_custom_text_field.dart';
import 'currency_custum_text.dart';
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
        resizeToAvoidBottomInset: false,
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
                    widget.homeStore.realController?.clear();
                  },
                  prefix: S.of(context).homeScreenRealPrefixTextField,
                  labelText: S.of(context).homeScreenRealLabelTextField,
                  onChanged: (value) {
                    widget.homeStore.getCurrency(value, CurrencyType.real);
                  },
                  textEditingController: widget.homeStore.realController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  onTap: () {
                    widget.homeStore.dollarController?.clear();
                  },
                  prefix: S.of(context).homeScreenDollarsPrefixTextField,
                  labelText: S.of(context).homeScreenDollarsLabelTextField,
                  onChanged: (value) {
                    widget.homeStore.getCurrency(value, CurrencyType.dollar);
                  },
                  textEditingController: widget.homeStore.dollarController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CurrencyCustomTextField(
                  onTap: () {
                    widget.homeStore.eurController?.clear();
                  },
                  prefix: S.of(context).homeScreenEurosPrefixTextField,
                  labelText: S.of(context).homeScreenEurosLabelTextField,
                  onChanged: (value) {
                    widget.homeStore.getCurrency(value, CurrencyType.euro);
                  },
                  textEditingController: widget.homeStore.eurController,
                ),
                const SizedBox(
                  height: 35,
                ),
                Observer(
                  builder: (context) {
                    switch (widget.homeStore.homeState) {
                      case HomeState.initial:
                        return CurrencyCustomText(
                            text: S.of(context).homeScreenEnterTheValueText);
                      case HomeState.loading:
                        return Container(
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case HomeState.occurredGenericError:
                        return CurrencyCustomText(
                            text: S
                                .of(context)
                                .homeScreenOccurredGenericErrorText);
                      case HomeState.occurredNetworkError:
                        return CurrencyCustomText(
                            text: S.of(context).homeScreenConnectionFailText);
                      case HomeState.success:
                        return CurrencyCustomText(
                            text: S.of(context).homeScreenConvertedValuesText);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
