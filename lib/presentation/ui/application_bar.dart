import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moneum/presentation/cubit/application_bar/application_bar_cubit.dart';
import 'package:poseidon/poseidon.dart';

import 'material_icon.dart';

class ApplicationBar extends StatelessWidget {
  const ApplicationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBarCubit, ApplicationBarState>(
        bloc: GetIt.instance<ApplicationBarCubit>(),
        builder: (context, state) {
          if (state is ApplicationBarShow) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: state.isBottomBorderVisible
                      ? Border(
                          bottom:
                              BorderSide(color: Colors.white.withOpacity(0.15)))
                      : const Border()),
              padding: const EdgeInsets.only(top: 30),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: MaterialIcon(
                                          assetName:
                                              'assets/images/icons/menu-burger.svg',
                                          width: 16,
                                          heigth: 11,
                                          color: Colors.white,
                                          onPressed: () {
                                            Poseidon.instance.openDrawer();
                                          })),
                                  Text(state.title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ],
                              )),
                          SizedBox(
                              width: constraints.maxWidth * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialIcon(
                                      assetName: 'assets/images/icons/plus.svg',
                                      width: 11 * 1.1,
                                      heigth: 11 * 1.1,
                                      color: Colors.white,
                                      onPressed: state.plusIconOnPressed),
                                  const MaterialIcon(
                                      assetName:
                                          'assets/images/icons/filter.svg',
                                      color: Colors.white,
                                      width: 18 * 1.35,
                                      heigth: 9 * 1.35),
                                  const MaterialIcon(
                                      assetName:
                                          'assets/images/icons/vertical-menu-dots.svg',
                                      color: Colors.white,
                                      width: 3 * 1.1,
                                      heigth: 13 * 1.1)
                                ],
                              ))
                        ],
                      ),
                    ),
                    if (state.content != null) state.content!
                  ],
                );
              }),
            );
          } else {
            return Container();
          }
        });
  }
}
