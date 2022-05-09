import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/search_bar/filter/category/search_bar_filter_operation_select_dialog_item_data.dart';
import '../../../../ui/dialog/select_list/select_dialog_list.dart';
import '../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';
import 'search_bar_filter_category_cubit.dart';

enum OperationType { income, consumption, transfer, all }

class SearchBarFilterOperationCategoryCubit
    extends SearchBarFilterCategoryCubit {
  final StreamController _selectController = StreamController.broadcast();

  late final SelectDialogListCubit<SearchBarFilterOperationSelectDialogItemData>
      _selectDialogCubit;

  OperationType? _type;

  OperationType? get type => _type;

  SearchBarFilterOperationCategoryCubit(
      String name, double width, double heigth, EdgeInsets margin)
      : super(name, width, heigth, margin) {
    _selectDialogCubit =
        SelectDialogListCubit<SearchBarFilterOperationSelectDialogItemData>(
            'Выберите тип операции', [
      SearchBarFilterOperationSelectDialogItemData(
          'Доход', OperationType.income),
      SearchBarFilterOperationSelectDialogItemData(
          'Расход', OperationType.consumption),
      SearchBarFilterOperationSelectDialogItemData(
          'Перевод', OperationType.transfer),
      SearchBarFilterOperationSelectDialogItemData('Все', OperationType.all)
    ], onSelect: (data, index) {
      _selectController.sink.add(data);
    }, bottomButtonType: SelectDialogCubitBottomButtonType.cancel);
  }

  @override
  void select() async {
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

      if (event is SearchBarFilterOperationSelectDialogItemData) {
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

  @override
  Future<void> close() async {
    await _selectController.close();

    return super.close();
  }
}
