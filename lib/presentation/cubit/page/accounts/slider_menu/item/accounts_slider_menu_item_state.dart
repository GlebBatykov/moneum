part of 'accounts_slider_menu_item_cubit.dart';

@immutable
abstract class AccountsSliderMenuItemState {
  final String title;

  const AccountsSliderMenuItemState(this.title);
}

class AccountsSliderMenuItemSelected extends AccountsSliderMenuItemState {
  const AccountsSliderMenuItemSelected(String title) : super(title);
}

class AccountsSliderMenuItemUnselected extends AccountsSliderMenuItemState {
  const AccountsSliderMenuItemUnselected(String title) : super(title);
}
