part of 'drawer_menu_cubit.dart';

@immutable
abstract class DrawerMenuState {}

class DrawerMenuInitial extends DrawerMenuState {}

class DrawerMenuShow extends DrawerMenuState {
  final List<DrawerMenuItemCubit> itemCubits;

  DrawerMenuShow(this.itemCubits);
}
