import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_menu_item_state.dart';

class DrawerMenuItemCubit extends Cubit<DrawerMenuItemState> {
  final int index;

  final String _title;

  final void Function() _onPressed;

  bool _isSelected = false;

  DrawerMenuItemCubit(this.index, String title, void Function() onPressed)
      : _title = title,
        _onPressed = onPressed,
        super(DrawerMenuItemUnselect(title, onPressed));

  void select() {
    if (!_isSelected) {
      emit(DrawerMenuItemSelect(_title));

      _isSelected = true;
    }
  }

  void unselect() {
    if (_isSelected) {
      emit(DrawerMenuItemUnselect(_title, _onPressed));

      _isSelected = false;
    }
  }
}
