part of 'select_dialog_range_cubit.dart';

@immutable
abstract class SelectDialogRangeState {}

class SelectDialogRangeInitial extends SelectDialogRangeState {}

class SelectDialogRangeShow extends SelectDialogRangeState {
  final String title;

  final TextEditingController beginEditingController;

  final TextEditingController endEditingController;

  SelectDialogRangeShow(
      this.title, this.beginEditingController, this.endEditingController);
}
