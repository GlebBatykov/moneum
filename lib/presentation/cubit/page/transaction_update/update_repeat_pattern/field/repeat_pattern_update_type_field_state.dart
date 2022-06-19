part of 'repeat_pattern_update_type_field_cubit.dart';

@immutable
abstract class RepeatPatternUpdateTypeFieldState {}

class RepeatPatternUpdateTypeFieldInitial
    extends RepeatPatternUpdateTypeFieldState {}

class RepeatPatternUpdateTypeFieldShow
    extends RepeatPatternUpdateTypeFieldState {
  final String title;

  final SelectDialogListCubit<UpdateRepeatPatternFieldSelectDialogItemData>
      selectDialogCubit;

  RepeatPatternUpdateTypeFieldShow(this.title, this.selectDialogCubit);
}
