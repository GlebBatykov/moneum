part of 'repeat_pattern_update_type_properties_cubit.dart';

@immutable
abstract class RepeatPatternUpdateTypePropertiesState {}

class RepeatPatternUpdateTypePropertiesInitial
    extends RepeatPatternUpdateTypePropertiesState {}

class RepeatPatternUpdateTypePropertiesWithoutRepeat
    extends RepeatPatternUpdateTypePropertiesState {}

class RepeatPatternUpdateTypePropertiesEveryDay
    extends RepeatPatternUpdateTypePropertiesState {
  final EveryDayRepeatPatternUpdateTypePropertiesCubit everyDayPropertiesCubit;

  RepeatPatternUpdateTypePropertiesEveryDay(this.everyDayPropertiesCubit);
}

class RepeatPatternUpdateTypePropertiesEveryWeek
    extends RepeatPatternUpdateTypePropertiesState {
  final EveryWeekRepeatPatternUpdateTypePropertiesCubit
      everyWeekPropertiesCubit;

  RepeatPatternUpdateTypePropertiesEveryWeek(this.everyWeekPropertiesCubit);
}

class RepeatPatternUpdateTypePropertiesEveryMonth
    extends RepeatPatternUpdateTypePropertiesState {
  final EveryMonthRepeatPatternUpdateTypePropertiesCubit
      everyMonthPropertiesCubit;

  RepeatPatternUpdateTypePropertiesEveryMonth(this.everyMonthPropertiesCubit);
}
