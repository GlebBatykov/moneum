import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/cubit/page/accounts/accounts_page_cubit.dart';
import 'package:moneum/presentation/ui/page/accounts/dot_slider/accounts_dot_slider.dart';
import 'package:moneum/presentation/ui/page/accounts/slider_menu/accounts_slider_menu.dart';
import 'package:poseidon/poseidon.dart';

import '../../content_divider.dart';
import 'accounts_balance.dart';
import 'buttons/accounts_buttons.dart';
import 'card/accounts_card.dart';
import 'card/accounts_card_setting.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  Widget _buildPage(AccountsPageState state) {
    if (state is AccountsPageEmpty) {
      return Stack(
        children: [
          const Positioned.fill(
              child: AccountsBalance(
                  notOnResultBalance: 0, onResultBalance: 11.1)),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('Список счетов пуст.',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('Ваши счета будут отображаться здесь',
                        style: TextStyle(
                            color: HexColor('#B0B0B0'), fontFamily: 'Arial'))),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text('Пока у вас нет счетов.',
                        style: TextStyle(
                            color: HexColor('#B0B0B0'), fontFamily: 'Arial'))),
                TextButton(
                    onPressed: () {
                      Poseidon.instance.navigate('add-account');
                    },
                    child: Text('Добавить счет',
                        style: TextStyle(
                            fontFamily: 'Arial',
                            color: HexColor('#0088FF'),
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ))
        ],
      );
    } else if (state is AccountsPageNotEmpty) {
      return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();

            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AccountsBalance(
                    notOnResultBalance: 0, onResultBalance: 11.1),
                Container(
                  width: AccountsCardSetting.cardWidth + 20,
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AccountsCard(),
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: BlocProvider.value(
                              value: state.dotSliderCubit,
                              child: const AccountsDotSlider())),
                      const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: AccountsButtons()),
                      Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: const ContentDivider(
                              margin: EdgeInsets.only(top: 5, bottom: 5))),
                      BlocProvider.value(
                          value: state.sliderMenuCubit,
                          child: const AccountsSliderMenu())
                    ],
                  ),
                )
              ],
            ),
          ));
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var accountsPageCubit = GetIt.instance<AccountsPageCubit>();

    return BlocBuilder<AccountsPageCubit, AccountsPageState>(
        bloc: accountsPageCubit,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: _buildPage(state),
          );
        });
  }
}
