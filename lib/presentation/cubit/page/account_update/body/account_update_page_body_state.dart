part of 'account_update_page_body_cubit.dart';

@immutable
abstract class AccountUpdatePageBodyState {}

class AccountUpdatePageBodyInitial extends AccountUpdatePageBodyState {}

class AccountUpdatePageBodyShow extends AccountUpdatePageBodyState {
  final TextEditingController titleEditingController;

  final AccountUpdateCurrencyFieldCubit updateCurrencyFieldCubit;

  final TextEditingController balanceEditingController;

  final AccountUpdateConsideFieldCubit updateConsideFieldCubit;

  AccountUpdatePageBodyShow(
      this.titleEditingController,
      this.updateCurrencyFieldCubit,
      this.balanceEditingController,
      this.updateConsideFieldCubit);
}
