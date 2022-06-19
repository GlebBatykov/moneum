import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../model/page/transaction_update/field/repeat/every_day_repeat_pattern.dart';
import '../../../../../../model/page/transaction_update/field/repeat/every_month_repeat_pattern.dart';
import '../../../../../../model/page/transaction_update/field/repeat/every_week_repeat_pattern.dart';
import '../../../../../../model/page/transaction_update/field/repeat/properties/every_day_repeat_pattern_propeties.dart';
import '../../../../../../model/page/transaction_update/field/repeat/properties/every_month_repeat_pattern_propeties.dart';
import '../../../../../../model/page/transaction_update/field/repeat/properties/every_week_repeat_pattern_propeties.dart';
import '../../../../../../model/page/transaction_update/field/repeat/repeat_pattern.dart';
import '../../../../../../model/page/transaction_update/field/repeat/repeat_type.dart';
import 'every_day/every_day_repeat_pattern_update_type_properties_cubit.dart';
import 'every_month/every_week_repeat_pattern_update_type_properties_cubit.dart';
import 'every_week/every_month_repeat_pattern_update_type_properties_cubit.dart';

part 'repeat_pattern_update_type_properties_state.dart';

class RepeatPatternUpdateTypePropertiesCubit
    extends Cubit<RepeatPatternUpdateTypePropertiesState> {
  late final EveryDayRepeatPatternUpdateTypePropertiesCubit
      _everyDayPropertiesCubit;

  late final EveryWeekRepeatPatternUpdateTypePropertiesCubit
      _everyWeekPropertiesCubit;

  late final EveryMonthRepeatPatternUpdateTypePropertiesCubit
      _everyMonthPropertiesCubit;

  RepeatPatternUpdateTypePropertiesCubit(RepeatPattern pattern)
      : super(RepeatPatternUpdateTypePropertiesInitial()) {
    _initialize(pattern);
  }

  void _initialize(RepeatPattern pattern) {
    if (pattern is EveryDayRepeatPattern) {
      _everyDayPropertiesCubit =
          EveryDayRepeatPatternUpdateTypePropertiesCubit.update(pattern);
    } else {
      _everyDayPropertiesCubit =
          EveryDayRepeatPatternUpdateTypePropertiesCubit.add();
    }

    if (pattern is EveryWeekRepeatPattern) {
      _everyWeekPropertiesCubit =
          EveryWeekRepeatPatternUpdateTypePropertiesCubit.update(pattern);
    } else {
      _everyWeekPropertiesCubit =
          EveryWeekRepeatPatternUpdateTypePropertiesCubit.add();
    }

    if (pattern is EveryMonthRepeatPattern) {
      _everyMonthPropertiesCubit =
          EveryMonthRepeatPatternUpdateTypePropertiesCubit.update(pattern);
    } else {
      _everyMonthPropertiesCubit =
          EveryMonthRepeatPatternUpdateTypePropertiesCubit.add();
    }

    _show(pattern.type);
  }

  EveryDayRepeatPatternProperties getEveryDayPatternProperties() {
    return _everyDayPropertiesCubit.getProperties();
  }

  EveryWeekRepeatPatternProperties getEveryWeekProperties() {
    return _everyWeekPropertiesCubit.getProperties();
  }

  EveryMonthRepeatPatternProperties getEveryMonthProperties() {
    return _everyMonthPropertiesCubit.getProperties();
  }

  void changeType(RepeatType type) {
    _show(type);
  }

  void _show(RepeatType type) {
    switch (type) {
      case RepeatType.everyDay:
        emit(RepeatPatternUpdateTypePropertiesEveryDay(
            _everyDayPropertiesCubit));
        break;
      case RepeatType.everyMonth:
        emit(RepeatPatternUpdateTypePropertiesEveryMonth(
            _everyMonthPropertiesCubit));
        break;
      case RepeatType.everyWeek:
        emit(RepeatPatternUpdateTypePropertiesEveryWeek(
            _everyWeekPropertiesCubit));
        break;
      case RepeatType.withoutRepeat:
        emit(RepeatPatternUpdateTypePropertiesWithoutRepeat());
    }
  }
}
