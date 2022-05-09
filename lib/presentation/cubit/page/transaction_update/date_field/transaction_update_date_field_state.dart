part of 'transaction_update_date_field_cubit.dart';

@immutable
abstract class TransactionUpdateDateFieldState {}

class TransactionUpdateDateFieldInitial
    extends TransactionUpdateDateFieldState {}

class TransactionUpdateDateFieldShow extends TransactionUpdateDateFieldState {
  final String title;

  TransactionUpdateDateFieldShow(this.title);
}
