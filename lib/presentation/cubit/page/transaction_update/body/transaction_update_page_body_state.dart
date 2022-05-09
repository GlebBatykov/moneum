part of 'transaction_update_page_body_cubit.dart';

@immutable
abstract class TransactionUpdatePageBodyState {}

class TransactionUpdatePageBodyInitial extends TransactionUpdatePageBodyState {}

class TransactionUpdatePageBodyShow extends TransactionUpdatePageBodyState {
  final TransactionUpdateCategoryFieldCubit categoryFieldCubit;

  final UpdateDateFieldCubit dateFieldCubit;

  final TransactionUpdateRepeatFieldCubit repeatFieldCubit;

  final TransactionUpdateSumFieldCubit sumFieldCubit;

  final TransactionUpdateScoreFieldCubit scoreFieldCubit;

  final TextEditingController commentEditingController;

  TransactionUpdatePageBodyShow(
      this.categoryFieldCubit,
      this.dateFieldCubit,
      this.repeatFieldCubit,
      this.scoreFieldCubit,
      this.sumFieldCubit,
      this.commentEditingController);
}
