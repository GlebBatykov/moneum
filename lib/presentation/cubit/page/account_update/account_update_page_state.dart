part of 'account_update_page_cubit.dart';

@immutable
abstract class AccountUpdatePageState {}

class AccountUpdatePageInitial extends AccountUpdatePageState {}

class AccountUpdatePageShow extends AccountUpdatePageState {
  final String title;

  final AccountUpdatePageBodyCubit bodyCubit;

  AccountUpdatePageShow(this.title, this.bodyCubit);
}
