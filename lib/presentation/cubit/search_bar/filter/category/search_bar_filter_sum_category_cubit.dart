import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moneum/presentation/cubit/dialog/select_dialog_range/select_dialog_range_cubit.dart';
import 'package:moneum/presentation/cubit/search_bar/filter/category/search_bar_filter_category_cubit.dart';
import 'package:moneum/presentation/model/dialog/select_dialog_range_data.dart';
import 'package:moneum/presentation/ui/dialog/select_range/select_dialog_range.dart';
import 'package:poseidon/poseidon.dart';

class SearchBarFilterSumCategoryCubit extends SearchBarFilterCategoryCubit {
  final StreamController<SelectDialogRangeData> _selectController =
      StreamController.broadcast();

  late final SelectDialogRangeCubit _selectDialogCubit;

  double? _begin;

  double? _end;

  double? get begin => _begin;

  double? get end => end;

  SearchBarFilterSumCategoryCubit(
      String name, double width, double heigth, EdgeInsets margin,
      {double? begin, double? end})
      : _begin = begin,
        _end = end,
        super(name, width, heigth, margin) {
    _selectDialogCubit =
        SelectDialogRangeCubit('Введите сумму', onSelect: (data) {
      _selectController.sink.add(data);
    });
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
      return SelectDialogRange(cubit: _selectDialogCubit);
    })).listen((event) => resultController.sink.add(event));

    resultSubscription = resultController.stream.listen((event) async {
      await selectSubscription.cancel();
      await resultSubscription.cancel();
      await closeSubscription.cancel();
      await resultController.close();

      if (event is SelectDialogRangeData) {
        _begin = event.begin;
        _end = event.end;

        super.select();

        Poseidon.instance.pop();
      }
    });
  }

  @override
  void unselect() {
    _begin = null;
    _end = null;

    super.unselect();
  }
}
