part of 'every_day_repeat_pattern_update_type_properties_cubit.dart';

@immutable
abstract class EveryDayRepeatPatternUpdateTypePropertiesState {}

class EveryDayRepeatPatternUpdateTypePropertiesInitial
    extends EveryDayRepeatPatternUpdateTypePropertiesState {}

class EveryDayRepeatPatternUpdateTypePropertiesShow
    extends EveryDayRepeatPatternUpdateTypePropertiesState {
  final TextEditingController dayFrequencyEditingController;

  final UpdateDateFieldCubit dateFieldCubit;

  final RepeatPatternUpdateTypePropertiesPeriodFieldCubit periodFieldCubit;

  EveryDayRepeatPatternUpdateTypePropertiesShow(
      this.dayFrequencyEditingController,
      this.dateFieldCubit,
      this.periodFieldCubit);
}
