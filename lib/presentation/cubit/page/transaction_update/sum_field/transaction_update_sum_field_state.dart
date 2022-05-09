part of 'transaction_update_sum_field_cubit.dart';

@immutable
abstract class TransactionUpdateSumFieldState {}

class TransactionUpdateSumFieldInitial extends TransactionUpdateSumFieldState {}

class TransactionUpdateSumFieldShow extends TransactionUpdateSumFieldState {
  final TypeOperationToggleButtonCubit toggleButtonCubit;

  final TextEditingController editingController;

  TransactionUpdateSumFieldShow(this.toggleButtonCubit, this.editingController);
}
