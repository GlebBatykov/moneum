part of 'transaction_update_page_cubit.dart';

@immutable
abstract class TransactionUpdatePageState {}

class TransactionUpdatePageInitial extends TransactionUpdatePageState {}

class TransactionUpdatePageShow extends TransactionUpdatePageState {
  final String title;

  final TransactionUpdatePageBodyCubit bodyCubit;

  TransactionUpdatePageShow(this.title, this.bodyCubit);
}
