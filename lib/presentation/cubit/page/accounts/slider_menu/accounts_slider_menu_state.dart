part of 'accounts_slider_menu_cubit.dart';

@immutable
abstract class AccountsSliderMenuState {}

class AccountsSliderMenuInitial extends AccountsSliderMenuState {}

class AccountsSliderMenuShow extends AccountsSliderMenuState {
  final List<AccountsSliderMenuItemCubit> itemsCubits;

  AccountsSliderMenuShow(this.itemsCubits);
}
