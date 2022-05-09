import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UpdateFieldTitle extends StatelessWidget {
  final String title;

  final String hint;

  const UpdateFieldTitle({Key? key, required this.title, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: Text(title,
                style: const TextStyle(
                    fontSize: 20 * 1.2,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
        Text(hint,
            style: TextStyle(
                fontSize: 13 * 1.2,
                fontFamily: 'Arial',
                color: HexColor('#B0B0B0'))),
      ],
    );
  }
}
