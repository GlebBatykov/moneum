part of 'transaction_update_category_field_cubit.dart';

@immutable
abstract class TransactionUpdateCategoryFieldState {}

class TransactionUpdateCategoryFieldInitial
    extends TransactionUpdateCategoryFieldState {}

class TransactionUpdateCategoryFieldShow
    extends TransactionUpdateCategoryFieldState {
  final String title;

  final SelectDialogListCubit<
      TransactionUpdateCategoryFieldSelectDialogItemData> selectDialogCubit;

  TransactionUpdateCategoryFieldShow(this.title, this.selectDialogCubit);
}
