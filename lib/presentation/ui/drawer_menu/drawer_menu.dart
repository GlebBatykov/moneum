import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/cubit/drawer_menu/drawer_menu_cubit.dart';
import 'package:moneum/presentation/cubit/drawer_menu/drawer_menu_item/drawer_menu_item_cubit.dart';
import 'package:moneum/presentation/ui/drawer_menu/drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  List<Widget> _buildItems(List<DrawerMenuItemCubit> itemCubits) {
    var items = <Widget>[];

    items.add(Container(
        margin: const EdgeInsets.only(top: 15),
        child: BlocProvider<DrawerMenuItemCubit>.value(
            value: itemCubits.first, child: const DrawerMenuItem())));

    for (var i = 1; i < itemCubits.length; i++) {
      items.add(BlocProvider<DrawerMenuItemCubit>.value(
          value: itemCubits[i], child: const DrawerMenuItem()));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 285,
      child: Drawer(
          backgroundColor: HexColor('#131313'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 176,
                color: HexColor('#101010'),
                child: Stack(
                  children: [
                    Positioned.fill(
                        top: 30,
                        child: Align(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/icons/logo.png')))
                  ],
                ),
              ),
              BlocBuilder<DrawerMenuCubit, DrawerMenuState>(
                  bloc: GetIt.instance<DrawerMenuCubit>(),
                  builder: (context, state) {
                    if (state is DrawerMenuShow) {
                      return Column(
                        children: _buildItems(state.itemCubits),
                      );
                    } else {
                      return Container();
                    }
                  })
            ],
          )),
    );
  }
}
