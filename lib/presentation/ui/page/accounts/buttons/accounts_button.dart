import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/ui/rounded_material_button.dart';

class AccountsButton extends StatelessWidget {
  final String title;

  final String assetPath;

  final void Function()? onTap;

  const AccountsButton(
      {Key? key,
      required this.title,
      required this.assetPath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: RoundedMaterialButton(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor('#262626'),
                    borderRadius: BorderRadius.circular(8)),
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(assetPath, color: Colors.white),
              )),
        ),
        Text(title,
            style: const TextStyle(
                fontFamily: 'Arial', fontSize: 13, color: Colors.white))
      ],
    );
  }
}
