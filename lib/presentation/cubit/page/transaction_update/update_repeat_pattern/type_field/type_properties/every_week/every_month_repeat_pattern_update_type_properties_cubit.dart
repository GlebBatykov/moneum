import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../model/page/transaction_update/field/repeat/period/infinite_period.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/properties/every_month_repeat_pattern_propeties.dart';

part 'every_month_repeat_pattern_update_type_properties_state.dart';

class EveryMonthRepeatPatternUpdateTypePropertiesCubit
    extends Cubit<EveryMonthRepeatPatternUpdateTypePropertiesState> {
  EveryMonthRepeatPatternUpdateTypePropertiesCubit()
      : super(EveryMonthRepeatPatternUpdateTypePropertiesInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(EveryMonthRepeatPatternUpdateTypePropertiesShow());
  }

  EveryMonthRepeatPatternProperties getProperties() {
    return EveryMonthRepeatPatternProperties(
        0, 0, DateTime.now(), InfinitePeriod());
  }
}
