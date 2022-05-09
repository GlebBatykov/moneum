part of 'update_repeat_pattern_page_cubit.dart';

@immutable
abstract class UpdateRepeatPatternPageState {}

class UpdateRepeatPatternPageInitial extends UpdateRepeatPatternPageState {}

class UpdateRepeatPatternPageShow extends UpdateRepeatPatternPageState {
  final RepeatPatternUpdateTypeFieldCubit typeFieldCubit;

  final RepeatPatternUpdateTypePropertiesCubit typePropertiesCubit;

  UpdateRepeatPatternPageShow(this.typeFieldCubit, this.typePropertiesCubit);
}
