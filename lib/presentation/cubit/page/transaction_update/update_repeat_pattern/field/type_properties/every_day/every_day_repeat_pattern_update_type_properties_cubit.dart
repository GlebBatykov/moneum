import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../../model/page/transaction_update/field/repeat/every_day_repeat_pattern.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/period/infinite_period_pattern.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/properties/every_day_repeat_pattern_propeties.dart';
import '../../../../../update_page/field/date_field/update_date_field_cubit.dart';
import '../field/period/repeat_pattern_update_type_properties_period_field_cubit.dart';

part 'every_day_repeat_pattern_update_type_properties_state.dart';

class EveryDayRepeatPatternUpdateTypePropertiesCubit
    extends Cubit<EveryDayRepeatPatternUpdateTypePropertiesState> {
  late final TextEditingController _dayFrequencyEditingController;

  late final UpdateDateFieldCubit _dateFieldCubit;

  late final RepeatPatternUpdateTypePropertiesPeriodFieldCubit
      _periodFieldCubit;

  EveryDayRepeatPatternUpdateTypePropertiesCubit.add()
      : super(EveryDayRepeatPatternUpdateTypePropertiesInitial()) {
    _initialize();
  }

  EveryDayRepeatPatternUpdateTypePropertiesCubit.update(
      EveryDayRepeatPattern pattern)
      : super(EveryDayRepeatPatternUpdateTypePropertiesInitial()) {
    _initialize(pattern);
  }

  void _initialize([EveryDayRepeatPattern? pattern]) {
    if (pattern != null) {
      _dayFrequencyEditingController =
          TextEditingController(text: pattern.dayFrequency.toString());

      _dateFieldCubit =
          UpdateDateFieldCubit.update('Начало', pattern.startDate);

      _periodFieldCubit =
          RepeatPatternUpdateTypePropertiesPeriodFieldCubit.update(
              pattern.periodPattern);
    } else {
      _dayFrequencyEditingController = TextEditingController(text: '1');

      _dateFieldCubit = UpdateDateFieldCubit.add('Начало');

      _periodFieldCubit =
          RepeatPatternUpdateTypePropertiesPeriodFieldCubit.add();
    }

    _show();
  }

  EveryDayRepeatPatternProperties getProperties() {
    return EveryDayRepeatPatternProperties(
        int.parse(_dayFrequencyEditingController.text),
        _dateFieldCubit.value,
        _periodFieldCubit.getPeriodPattern());
  }

  void _show() {
    emit(EveryDayRepeatPatternUpdateTypePropertiesShow(
        _dayFrequencyEditingController, _dateFieldCubit, _periodFieldCubit));
  }
}
