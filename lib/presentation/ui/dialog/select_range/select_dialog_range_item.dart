import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectDialogRangeItem extends StatelessWidget {
  final String title;

  final TextEditingController editingController;

  const SelectDialogRangeItem(
      {Key? key, required this.title, required this.editingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'Arial', fontSize: 13 * 1.2, color: Colors.white),
        ),
        Container(
          width: 179,
          height: 33 * 1.1,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)),
          child: Form(
              child: TextFormField(
            controller: editingController,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,
            style: TextStyle(color: HexColor('#A4A4A4')),
            decoration: InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(
                    fontFamily: 'Arial',
                    color: HexColor('#A4A4A4'),
                    fontSize: 17),
                border: InputBorder.none),
          )),
        )
      ],
    );
  }
}
