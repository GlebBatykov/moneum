import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:moneum/presentation/cubit/drawer_menu/drawer_menu_item/drawer_menu_item_cubit.dart';
import 'package:moneum/presentation/cubit/page_switcher/page_switcher_cubit.dart';
import 'package:moneum/presentation/model/drawer_menu/drawer_menu_item_data.dart';

part 'drawer_menu_state.dart';

class DrawerMenuCubit extends Cubit<DrawerMenuState> {
  final List<DrawerMenuItemCubit> _itemCubits = [];

  DrawerMenuCubit() : super(DrawerMenuInitial()) {
    var items = [
      DrawerMenuItemData('Счета', () {
        GetIt.instance<PageSwitcherCubit>().showAccounts();
      }),
      DrawerMenuItemData('Журнал', () {
        GetIt.instance<PageSwitcherCubit>().showLog();
      }),
      DrawerMenuItemData('Отчет', () {
        GetIt.instance<PageSwitcherCubit>().showReport();
      }),
      DrawerMenuItemData('Запланированно', () {
        GetIt.instance<PageSwitcherCubit>().showScheduled();
      }),
      DrawerMenuItemData('Планировщик', () {
        GetIt.instance<PageSwitcherCubit>().showScheduler();
      }),
      DrawerMenuItemData('Резервное копирование и облако', () {
        GetIt.instance<PageSwitcherCubit>().showBackup();
      })
    ];

    for (var i = 0; i < items.length; i++) {
      _itemCubits
          .add(DrawerMenuItemCubit(i + 1, items[i].title, items[i].onPressed));
    }

    _itemCubits.first.select();

    emit(DrawerMenuShow(List.from(_itemCubits)));
  }

  void selectItem(int index) {
    for (var cubit in _itemCubits) {
      if (cubit.index == index) {
        cubit.select();
      } else {
        cubit.unselect();
      }
    }
  }
}
