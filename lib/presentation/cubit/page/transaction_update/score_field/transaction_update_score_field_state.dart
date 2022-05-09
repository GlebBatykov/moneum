part of 'transaction_update_score_field_cubit.dart';

@immutable
abstract class TransactionUpdateScoreFieldState {}

class TransactionUpdateScoreFieldInitial
    extends TransactionUpdateScoreFieldState {}

class TransactionUpdateScoreFieldShow extends TransactionUpdateScoreFieldState {
  final String title;

  final SelectDialogListCubit<TransactionUpdateScoreFieldSelectDialogItemData>
      selectDialogCubit;

  TransactionUpdateScoreFieldShow(this.title, this.selectDialogCubit);
}
