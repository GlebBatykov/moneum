part of 'repeat_pattern_update_type_properties_period_field_cubit.dart';

@immutable
abstract class RepeatPatternUpdateTypePropertiesPeriodFieldState {}

class RepeatPatternUpdateTypePropertiesPeriodFieldInitial
    extends RepeatPatternUpdateTypePropertiesPeriodFieldState {}

class RepeatPatternUpdateTypePropertiesPeriodFieldShow
    extends RepeatPatternUpdateTypePropertiesPeriodFieldState {
  final String title;

  final SelectDialogListCubit<
          RepeatPatternUpdateTypePropertiesPeriodSelectDialogItemData>
      selectDialogCubit;

  RepeatPatternUpdateTypePropertiesPeriodFieldShow(
      this.title, this.selectDialogCubit);
}

class RepeatPatternUpdateTypePropertiesPeriodFieldInfinity
    extends RepeatPatternUpdateTypePropertiesPeriodFieldShow {
  RepeatPatternUpdateTypePropertiesPeriodFieldInfinity(
      super.title, super.selectDialogCubit);
}

class RepeatPatternUpdateTypePropertiesPeriodFieldCount
    extends RepeatPatternUpdateTypePropertiesPeriodFieldShow {
  final TextEditingController countEditingController;

  RepeatPatternUpdateTypePropertiesPeriodFieldCount(
      super.title, super.selectDialogCubit, this.countEditingController);
}

class RepeatPatternUpdateTypePropertiesPeriodFieldDate
    extends RepeatPatternUpdateTypePropertiesPeriodFieldShow {
  final UpdateDateFieldCubit dateFieldCubit;

  RepeatPatternUpdateTypePropertiesPeriodFieldDate(
      super.title, super.selectDialogCubit, this.dateFieldCubit);
}
