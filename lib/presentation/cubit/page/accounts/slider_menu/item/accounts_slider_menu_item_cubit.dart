import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'accounts_slider_menu_item_state.dart';

class AccountsSliderMenuItemCubit extends Cubit<AccountsSliderMenuItemState> {
  final String _title;

  bool _isSelected = false;

  AccountsSliderMenuItemCubit(String title)
      : _title = title,
        super(AccountsSliderMenuItemUnselected(title));

  void select() {
    if (!_isSelected) {
      emit(AccountsSliderMenuItemSelected(_title));

      _isSelected = true;
    }
  }

  void unselect() {
    if (_isSelected) {
      emit(AccountsSliderMenuItemUnselected(_title));

      _isSelected = false;
    }
  }
}
