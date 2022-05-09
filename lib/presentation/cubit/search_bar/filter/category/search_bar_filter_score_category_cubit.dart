import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/search_bar/filter/category/search_bar_filter_score_select_dialog_item_dart.dart';
import '../../../../ui/dialog/select_list/select_dialog_list.dart';
import '../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';
import 'search_bar_filter_category_cubit.dart';

enum ScoreType {
  notSelected,
  cash,
  debitCard,
  onlineWallet,
  scoreOlx,
  scoreAvito
}

class SearchBarFitlerScoreCategoryCubit extends SearchBarFilterCategoryCubit {
  final StreamController _selectController = StreamController.broadcast();

  late final SelectDialogListCubit<SearchBarFilterScoreSelectDialogItemData>
      _selectDialogCubit;

  ScoreType? _type;

  ScoreType? get type => _type;

  SearchBarFitlerScoreCategoryCubit(
      String name, double width, double heigth, EdgeInsets margin)
      : super(name, width, heigth, margin) {
    _selectDialogCubit =
        SelectDialogListCubit<SearchBarFilterScoreSelectDialogItemData>(
            'Выберите счет', [
      SearchBarFilterScoreSelectDialogItemData(
          'Не выбрано', ScoreType.notSelected),
      SearchBarFilterScoreSelectDialogItemData('Наличные', ScoreType.cash),
      SearchBarFilterScoreSelectDialogItemData(
          'Дебетовая карта', ScoreType.debitCard),
      SearchBarFilterScoreSelectDialogItemData(
          'Электронный кошелёк', ScoreType.onlineWallet),
      SearchBarFilterScoreSelectDialogItemData('Счет OLX', ScoreType.scoreOlx),
      SearchBarFilterScoreSelectDialogItemData(
          'Счет Avito', ScoreType.scoreAvito)
    ], onSelect: (data, index) {
      _selectController.sink.add(data);
    }, bottomButtonType: SelectDialogCubitBottomButtonType.cancel);
  }

  @override
  void select() {
    late StreamSubscription selectSubscription,
        closeSubscription,
        resultSubscription;

    var resultController = StreamController.broadcast();

    selectSubscription = _selectController.stream.listen((event) async {
      await selectSubscription.cancel();
      resultController.add(event);
    });

    closeSubscription =
        Stream.fromFuture(Poseidon.instance.callDialog((context) {
      return SelectDialogList(cubit: _selectDialogCubit);
    })).listen((event) => resultController.sink.add(event));

    resultSubscription = resultController.stream.listen((event) async {
      await selectSubscription.cancel();
      await resultSubscription.cancel();
      await closeSubscription.cancel();
      await resultController.close();

      if (event is SearchBarFilterScoreSelectDialogItemData) {
        super.select();

        Poseidon.instance.pop();
      }
    });
  }

  @override
  void unselect() {
    _type = null;

    super.unselect();
  }
}
