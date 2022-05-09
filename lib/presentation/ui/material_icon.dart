import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class MaterialIcon extends StatelessWidget {
  final String assetName;

  final double width;

  final double heigth;

  final void Function()? onPressed;

  final Color? color;

  const MaterialIcon(
      {Key? key,
      required this.assetName,
      required this.width,
      required this.heigth,
      this.color,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
              padding: const EdgeInsets.only(left: 2.5, right: 2.5),
              constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
              onPressed: onPressed,
              icon: SvgPicture.asset(assetName,
                  height: heigth,
                  width: width,
                  color: color ?? HexColor('#3D3E41'))),
        ));
  }
}
