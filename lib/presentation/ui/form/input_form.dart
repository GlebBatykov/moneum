import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InputForm extends StatelessWidget {
  final double? width;

  final double? height;

  final int? maxLength;

  final String? hintText;

  final int? maxLines;

  final EdgeInsets? contentPadding;

  final TextEditingController editingController;

  final TextAlign textAlign;

  const InputForm(
      {Key? key,
      this.width,
      this.height,
      this.maxLength,
      this.hintText,
      this.maxLines = 1,
      this.contentPadding,
      required this.editingController,
      this.textAlign = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8)),
      child: Form(
          child: TextFormField(
        controller: editingController,
        textAlign: textAlign,
        maxLength: maxLength,
        maxLines: maxLines,
        textInputAction: TextInputAction.done,
        style: TextStyle(color: HexColor('#A4A4A4'), fontFamily: 'Arial'),
        decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            contentPadding: contentPadding,
            hintStyle: TextStyle(
                fontFamily: 'Arial', color: HexColor('#A4A4A4'), fontSize: 17),
            border: InputBorder.none),
      )),
    );
  }
}
