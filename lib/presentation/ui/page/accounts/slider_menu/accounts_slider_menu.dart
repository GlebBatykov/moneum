import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:moneum/presentation/cubit/page/accounts/slider_menu/accounts_slider_menu_cubit.dart';
import 'package:moneum/presentation/ui/page/accounts/slider_menu/item/accounts_slider_menu_item.dart';

import '../../../../cubit/page/accounts/slider_menu/item/accounts_slider_menu_item_cubit.dart';
import '../card/accounts_card_setting.dart';

class AccountsSliderMenu extends StatelessWidget {
  const AccountsSliderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountsSliderMenuCubit = context.watch<AccountsSliderMenuCubit>();

    return BlocBuilder<AccountsSliderMenuCubit, AccountsSliderMenuState>(
        bloc: accountsSliderMenuCubit,
        builder: (context, state) {
          if (state is AccountsSliderMenuShow) {
            var menuHeight = 0.0;

            var lenght = state.itemsCubits.length;

            if (lenght == 1) {
              menuHeight = 36 + 24 + 84;
            } else if (lenght == 2) {
              menuHeight = state.itemsCubits.length * 36 + 24 + 84;
            } else {
              menuHeight = 222;
            }

            return SizedBox(
              height: menuHeight,
              width: AccountsCardSetting.cardWidth,
              child: Stack(
                children: [
                  Positioned.fill(
                      bottom: 18,
                      child: Align(
                          alignment: Alignment.center,
                          child: DottedBorder(
                              strokeWidth: 2,
                              dashPattern: const [5, 3],
                              color: Colors.white.withOpacity(0.15),
                              padding: EdgeInsets.zero,
                              radius: const Radius.circular(8),
                              borderType: BorderType.RRect,
                              child: Container(
                                width: 315,
                                height: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                              )))),
                  Positioned.fill(
                      bottom: 18,
                      child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                              'assets/images/account/menu/effect.svg'))),
                  Positioned.fill(
                      child: InfiniteCarousel.builder(
                          axisDirection: Axis.vertical,
                          itemCount: state.itemsCubits.length,
                          itemExtent: 36,
                          loop: state.itemsCubits.length > 1,
                          onIndexChanged: (index) {
                            accountsSliderMenuCubit.selectItem(index);
                          },
                          itemBuilder: (context, itemIndex, realIndex) {
                            return BlocProvider<
                                    AccountsSliderMenuItemCubit>.value(
                                value: state.itemsCubits[itemIndex],
                                child: const AccountsSliderMenuItem());
                          })),
                  Positioned.fill(
                      top: -1,
                      child: Column(
                        children: [
                          Container(
                            height: 16,
                            color: Colors.black,
                          ),
                          Container(
                            height: 44,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: state.itemsCubits.length > 1
                                        ? [
                                            Colors.black,
                                            Colors.black.withOpacity(0)
                                          ]
                                        : [
                                            Colors.transparent,
                                            Colors.transparent
                                          ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          )
                        ],
                      )),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 44,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: state.itemsCubits.length > 1
                                            ? [
                                                Colors.black,
                                                Colors.black.withOpacity(0)
                                              ]
                                            : [
                                                Colors.transparent,
                                                Colors.transparent
                                              ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                              ),
                              Container(
                                height: 30,
                                color: Colors.black,
                              )
                            ],
                          )))
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
