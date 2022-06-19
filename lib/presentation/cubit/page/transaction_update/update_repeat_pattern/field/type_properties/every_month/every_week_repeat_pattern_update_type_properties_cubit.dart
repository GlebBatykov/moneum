import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../../model/page/transaction_update/field/repeat/every_week_repeat_pattern.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/period/infinite_period_pattern.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/properties/every_week_repeat_pattern_propeties.dart';

part 'every_week_repeat_pattern_update_type_properties_state.dart';

class EveryWeekRepeatPatternUpdateTypePropertiesCubit
    extends Cubit<EveryWeekRepeatPatternUpdateTypePropertiesState> {
  late final TextEditingController _weekFrequencyEditingController;

  EveryWeekRepeatPatternUpdateTypePropertiesCubit.add()
      : super(EveryWeekRepeatPatternUpdateTypePropertiesInitial()) {
    _initialize();
  }

  EveryWeekRepeatPatternUpdateTypePropertiesCubit.update(
      EveryWeekRepeatPattern pattern)
      : super(EveryWeekRepeatPatternUpdateTypePropertiesInitial()) {
    _initialize(pattern);
  }

  void _initialize([EveryWeekRepeatPattern? pattern]) {
    if (pattern != null) {
      _weekFrequencyEditingController =
          TextEditingController(text: pattern.weekFrequency.toString());
    } else {
      _weekFrequencyEditingController = TextEditingController(text: '0');
    }

    _show();
  }

  EveryWeekRepeatPatternProperties getProperties() {
    return EveryWeekRepeatPatternProperties(
        0, DateTime.now(), InfinitePeriodPattern());
  }

  void _show() {
    emit(EveryWeekRepeatPatternUpdateTypePropertiesShow(
        _weekFrequencyEditingController));
  }
}
