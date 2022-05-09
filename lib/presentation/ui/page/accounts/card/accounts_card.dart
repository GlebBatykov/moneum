import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:blur/blur.dart';

import 'accounts_card_purple.dart';
import 'accounts_card_setting.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var markHeight = 26.0;

    return SizedBox(
      height: AccountsCardSetting.cardHeigth + markHeight,
      width: AccountsCardSetting.cardWidth,
      child: Stack(
        children: [
          const AccountsCardPurple(),
          Positioned(
              top: 1,
              right: 26,
              child: SvgPicture.asset(
                  'assets/images/account/account-block-graymark.svg',
                  color: HexColor('#262626'))),
          Positioned.fill(
              top: markHeight,
              child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/account/account-block.svg',
                        width: 315 * 1.1,
                        height: AccountsCardSetting.cardHeigth,
                        color: Colors.white.withOpacity(0.0),
                      ))
                  .blurred(
                      blur: 25,
                      borderRadius: BorderRadius.circular(8),
                      blurColor: Colors.white,
                      colorOpacity: 0.12)),
          const Positioned(
              left: 30 * 1.1,
              top: 31 * 1.55,
              child: Text('Наличные',
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14 * 1.2,
                      color: Colors.white))),
          Positioned(
              right: 15,
              top: 32 * 1.55,
              child: Text('Создан: 02.02.2022',
                  style: TextStyle(
                      fontSize: 13 * 1.15,
                      fontFamily: 'Arial',
                      color: HexColor('#B0B0B0')))),
          const Positioned.fill(
              top: 26,
              child: Align(
                  alignment: Alignment.center,
                  child: Text('8 000,00 руб.',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20 * 1.1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))))
        ],
      ),
    );
  }
}
