part of 'account_update_currency_field_cubit.dart';

@immutable
abstract class AccountUpdateCurrencyFieldState {}

class AccountUpdateCurrencyFieldInitial
    extends AccountUpdateCurrencyFieldState {}

class AccountUpdateCurrencyFieldShow extends AccountUpdateCurrencyFieldState {
  final String shortTitle;

  final SelectDialogListCubit selectDialogCubit;

  AccountUpdateCurrencyFieldShow(this.shortTitle, this.selectDialogCubit);
}
