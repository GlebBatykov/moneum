import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../../../../model/page/transaction_update/field/repeat/period/count_period_pattern.dart';
import '../../../../../../../../model/page/transaction_update/field/repeat/period/date_period_pattern.dart';
import '../../../../../../../../model/page/transaction_update/field/repeat/period/infinite_period_pattern.dart';
import '../../../../../../../../model/page/transaction_update/field/repeat/period/pattern/period_pattern.dart';
import '../../../../../../../../model/page/transaction_update/field/repeat/period/repeat_pattern_update_type_properties_period_select_dialog_item_data.dart';
import '../../../../../../../../model/page/transaction_update/field/repeat/period/repeat_period_type.dart';
import '../../../../../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';
import '../../../../../../update_page/field/date_field/update_date_field_cubit.dart';

part 'repeat_pattern_update_type_properties_period_field_state.dart';

class RepeatPatternUpdateTypePropertiesPeriodFieldCubit
    extends Cubit<RepeatPatternUpdateTypePropertiesPeriodFieldState> {
  late final SelectDialogListCubit<
          RepeatPatternUpdateTypePropertiesPeriodSelectDialogItemData>
      _selectDialogCubit;

  late final TextEditingController _countEditingController;

  late final UpdateDateFieldCubit _dateFieldCubit;

  late String _title;

  late RepeatPeriodType _type;

  RepeatPatternUpdateTypePropertiesPeriodFieldCubit.add()
      : super(RepeatPatternUpdateTypePropertiesPeriodFieldInitial()) {
    _initialize(InfinitePeriodPattern());
  }

  RepeatPatternUpdateTypePropertiesPeriodFieldCubit.update(
      PeriodPattern pattern)
      : super(RepeatPatternUpdateTypePropertiesPeriodFieldInitial()) {
    _initialize(pattern);
  }

  void _initialize(PeriodPattern pattern) {
    _selectDialogCubit = SelectDialogListCubit<
            RepeatPatternUpdateTypePropertiesPeriodSelectDialogItemData>(
        'Выберите периодичность',
        List.generate(RepeatPeriodType.values.length, (index) {
          var type = RepeatPeriodType.values[index];

          return RepeatPatternUpdateTypePropertiesPeriodSelectDialogItemData(
              type.name, type);
        }), onSelect: (data, index) {
      _title = data.title;
      _type = data.type;

      _show(_type);

      Poseidon.instance.pop();
    }, selected: RepeatPeriodType.values.indexOf(pattern.type));

    _title = _selectDialogCubit.selectedItem.title;
    _type = _selectDialogCubit.selectedItem.type;

    if (pattern is CountPeriodPattern) {
      _countEditingController =
          TextEditingController(text: pattern.count.toString());
    } else {
      _countEditingController = TextEditingController(text: '10');
    }

    if (pattern is DatePeriodPattern) {
      _dateFieldCubit = UpdateDateFieldCubit.update('Конец', pattern.endDate);
    } else {
      _dateFieldCubit = UpdateDateFieldCubit.add('Конец');
    }

    _show(pattern.type);
  }

  PeriodPattern getPeriodPattern() {
    late PeriodPattern pattern;

    switch (_type) {
      case RepeatPeriodType.count:
        pattern = CountPeriodPattern(int.parse(_countEditingController.text));
        break;
      case RepeatPeriodType.date:
        pattern = DatePeriodPattern(_dateFieldCubit.value);
        break;
      case RepeatPeriodType.infinity:
    }

    return pattern;
  }

  void _show(RepeatPeriodType type) {
    switch (type) {
      case RepeatPeriodType.count:
        emit(RepeatPatternUpdateTypePropertiesPeriodFieldCount(
            _title, _selectDialogCubit, _countEditingController));
        break;
      case RepeatPeriodType.date:
        emit(RepeatPatternUpdateTypePropertiesPeriodFieldDate(
            _title, _selectDialogCubit, _dateFieldCubit));
        break;
      case RepeatPeriodType.infinity:
        emit(RepeatPatternUpdateTypePropertiesPeriodFieldInfinity(
            _title, _selectDialogCubit));
    }
  }
}
