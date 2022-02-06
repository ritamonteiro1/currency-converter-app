// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$homeStateAtom = Atom(name: '_HomeStore.homeState');

  @override
  HomeState get homeState {
    _$homeStateAtom.reportRead();
    return super.homeState;
  }

  @override
  set homeState(HomeState value) {
    _$homeStateAtom.reportWrite(value, super.homeState, () {
      super.homeState = value;
    });
  }

  final _$currencyResultAtom = Atom(name: '_HomeStore.currencyResult');

  @override
  CurrencyResult? get currencyResult {
    _$currencyResultAtom.reportRead();
    return super.currencyResult;
  }

  @override
  set currencyResult(CurrencyResult? value) {
    _$currencyResultAtom.reportWrite(value, super.currencyResult, () {
      super.currencyResult = value;
    });
  }

  final _$getCurrencyAsyncAction = AsyncAction('_HomeStore.getCurrency');

  @override
  Future<void> getCurrency(double typedValue, CurrencyType currencyType) {
    return _$getCurrencyAsyncAction
        .run(() => super.getCurrency(typedValue, currencyType));
  }

  @override
  String toString() {
    return '''
homeState: ${homeState},
currencyResult: ${currencyResult}
    ''';
  }
}
