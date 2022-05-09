part of 'drawer_menu_item_cubit.dart';

@immutable
abstract class DrawerMenuItemState {
  final String title;

  const DrawerMenuItemState(this.title);
}

class DrawerMenuItemSelect extends DrawerMenuItemState {
  const DrawerMenuItemSelect(String title) : super(title);
}

class DrawerMenuItemUnselect extends DrawerMenuItemState {
  final void Function() onPressed;

  const DrawerMenuItemUnselect(String title, this.onPressed) : super(title);
}
