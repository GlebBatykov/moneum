import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../rounded_material_button.dart';

class SelectButton extends StatelessWidget {
  final double? width;

  final double? height;

  final void Function() onTap;

  final String title;

  const SelectButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedMaterialButton(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)),
          child: Container(
            margin: const EdgeInsets.only(left: 12, right: 18),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Arial',
                              color: Colors.white))),
                  SvgPicture.asset(
                    'assets/images/icons/angle-small-down.svg',
                    color: Colors.white,
                  )
                ]),
          ),
        ));
  }
}
