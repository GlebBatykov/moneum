import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/drawer_menu/drawer_menu_cubit.dart';
import '../../cubit/drawer_menu/drawer_menu_item/drawer_menu_item_cubit.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var drawerMenuItemCubit = context.watch<DrawerMenuItemCubit>();

    return BlocBuilder<DrawerMenuItemCubit, DrawerMenuItemState>(
        bloc: drawerMenuItemCubit,
        builder: (context, state) {
          return GestureDetector(
            onTap: state is DrawerMenuItemUnselect
                ? () {
                    GetIt.instance<DrawerMenuCubit>()
                        .selectItem(drawerMenuItemCubit.index);

                    state.onPressed();
                  }
                : null,
            child: Container(
              height: 33,
              width: 285,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 36),
              color: Colors.transparent,
              child: Text(state.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: state is DrawerMenuItemUnselect
                          ? FontWeight.normal
                          : FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 15)),
            ),
          );
        });
  }
}
