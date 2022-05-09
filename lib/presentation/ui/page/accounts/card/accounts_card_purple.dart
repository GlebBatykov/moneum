import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountsCardPurple extends StatelessWidget {
  const AccountsCardPurple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 30,
        child: Container(
          width: 38.24,
          height: 54,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: HexColor('#6E00FF')),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
                'assets/images/account/icons/horizontal-menu-dots.svg',
                color: Colors.white),
          ),
        ));
  }
}
