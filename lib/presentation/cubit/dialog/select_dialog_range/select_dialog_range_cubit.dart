import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moneum/presentation/model/dialog/select_dialog_range_data.dart';

part 'select_dialog_range_state.dart';

typedef SelectDialogRangeOnSelectCallback = void Function(
    SelectDialogRangeData)?;

class SelectDialogRangeCubit extends Cubit<SelectDialogRangeState> {
  final String _title;

  final TextEditingController _beginEditingController = TextEditingController();

  final TextEditingController _endEditingController = TextEditingController();

  final SelectDialogRangeOnSelectCallback? _onSelect;

  SelectDialogRangeCubit(String title,
      {SelectDialogRangeOnSelectCallback? onSelect, double? begin, double? end})
      : _title = title,
        _onSelect = onSelect,
        super(SelectDialogRangeInitial()) {
    _initialize(begin, end);
  }

  void _initialize(double? begin, double? end) {
    emit(SelectDialogRangeShow(
        _title, _beginEditingController, _endEditingController));
  }

  void select() {
    var begin = _beginEditingController.text.isNotEmpty
        ? double.parse(_beginEditingController.text)
        : null;

    var end = _endEditingController.text.isNotEmpty
        ? double.parse(_endEditingController.text)
        : null;

    _onSelect?.call(SelectDialogRangeData(begin, end));
  }
}
