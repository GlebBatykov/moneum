import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../model/page/transaction_update/field/repeat/period/infinite_period.dart';
import '../../../../../../../model/page/transaction_update/field/repeat/properties/every_day_repeat_pattern_propeties.dart';

part 'every_day_repeat_pattern_update_type_properties_state.dart';

class EveryDayRepeatPatternUpdateTypePropertiesCubit
    extends Cubit<EveryDayRepeatPatternUpdateTypePropertiesState> {
  EveryDayRepeatPatternUpdateTypePropertiesCubit()
      : super(EveryDayRepeatPatternUpdateTypePropertiesInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(EveryDayRepeatPatternUpdateTypePropertiesShow());
  }

  EveryDayRepeatPatternProperties getProperties() {
    return EveryDayRepeatPatternProperties(0, DateTime.now(), InfinitePeriod());
  }
}
