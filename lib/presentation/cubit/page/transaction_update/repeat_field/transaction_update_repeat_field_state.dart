part of 'transaction_update_repeat_field_cubit.dart';

@immutable
abstract class TransactionUpdateRepeatFieldState {}

class TransactionUpdateRepeatFieldInitial
    extends TransactionUpdateRepeatFieldState {}

class TransactionUpdateRepeatFieldShow
    extends TransactionUpdateRepeatFieldState {
  final bool isRepeatEnabled;

  final String title;

  final SelectDialogListCubit<TransactionUpdateRepeatFieldSelectDialogItemData>
      selectDialogCubit;

  TransactionUpdateRepeatFieldShow(
      this.isRepeatEnabled, this.title, this.selectDialogCubit);
}
