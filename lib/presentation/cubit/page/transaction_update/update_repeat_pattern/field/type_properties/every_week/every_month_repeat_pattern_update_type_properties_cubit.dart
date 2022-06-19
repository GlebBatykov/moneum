import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../model/page/transaction_update/field/repeat/every_month_repeat_pattern.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/period/infinite_period_pattern.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/properties/every_month_repeat_pattern_propeties.dart';

part 'every_month_repeat_pattern_update_type_properties_state.dart';

class EveryMonthRepeatPatternUpdateTypePropertiesCubit
    extends Cubit<EveryMonthRepeatPatternUpdateTypePropertiesState> {
  EveryMonthRepeatPatternUpdateTypePropertiesCubit.add()
      : super(EveryMonthRepeatPatternUpdateTypePropertiesInitial()) {
    _addInitialize();
  }

  EveryMonthRepeatPatternUpdateTypePropertiesCubit.update(
      EveryMonthRepeatPattern pattern)
      : super(EveryMonthRepeatPatternUpdateTypePropertiesInitial()) {
    _updateInitialize(pattern);
  }

  void _addInitialize() {
    emit(EveryMonthRepeatPatternUpdateTypePropertiesShow());
  }

  void _updateInitialize(EveryMonthRepeatPattern pattern) {
    emit(EveryMonthRepeatPatternUpdateTypePropertiesShow());
  }

  EveryMonthRepeatPatternProperties getProperties() {
    return EveryMonthRepeatPatternProperties(
        0, 0, DateTime.now(), InfinitePeriodPattern());
  }
}
