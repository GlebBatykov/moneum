import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../model/page/transaction_update/field/repeat/period/infinite_period.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/properties/every_week_repeat_pattern_propeties.dart';

part 'every_week_repeat_pattern_update_type_properties_state.dart';

class EveryWeekRepeatPatternUpdateTypePropertiesCubit
    extends Cubit<EveryWeekRepeatPatternUpdateTypePropertiesState> {
  EveryWeekRepeatPatternUpdateTypePropertiesCubit()
      : super(EveryWeekRepeatPatternUpdateTypePropertiesInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(EveryWeekRepeatPatternUpdateTypePropertiesShow());
  }

  EveryWeekRepeatPatternProperties getProperties() {
    return EveryWeekRepeatPatternProperties(
        0, DateTime.now(), InfinitePeriod());
  }
}
