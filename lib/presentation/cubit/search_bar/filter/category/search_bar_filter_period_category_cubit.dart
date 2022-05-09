import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/search_bar/filter/category/search_bar_filter_period_select_dialog_item_data.dart';
import '../../../../ui/dialog/select_list/select_dialog_list.dart';
import '../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';
import 'search_bar_filter_category_cubit.dart';

enum PeriodType { day, week, month, year, allTime }

class SearchBarFilterPeriodCategoryCubit extends SearchBarFilterCategoryCubit {
  final StreamController _selectController = StreamController.broadcast();

  late final SelectDialogListCubit<SearchBarFilterPeriodSelectDialogItemData>
      _selectDialogCubit;

  PeriodType? _type;

  PeriodType? get type => _type;

  SearchBarFilterPeriodCategoryCubit(
      String name, double width, double heigth, EdgeInsets margin)
      : super(name, width, heigth, margin) {
    _selectDialogCubit =
        SelectDialogListCubit<SearchBarFilterPeriodSelectDialogItemData>(
            'Выберите период', [
      SearchBarFilterPeriodSelectDialogItemData('За день', PeriodType.day),
      SearchBarFilterPeriodSelectDialogItemData('За надель', PeriodType.week),
      SearchBarFilterPeriodSelectDialogItemData('За месяц', PeriodType.month),
      SearchBarFilterPeriodSelectDialogItemData('За год', PeriodType.year),
      SearchBarFilterPeriodSelectDialogItemData(
          'За всё время', PeriodType.allTime)
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

      if (event is SearchBarFilterPeriodSelectDialogItemData) {
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
