import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextButton extends StatelessWidget {
  final String text;

  final void Function()? onTap;

  final EdgeInsets? padding;

  final EdgeInsets? margin;

  final Color? color;

  const CustomTextButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.margin,
      this.padding,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Text(text,
            style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: color ?? HexColor('#0088FF'))),
      ),
    );
  }
}
