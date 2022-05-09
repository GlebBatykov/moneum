import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/domain/extension/double_extension.dart';

class AccountsBalance extends StatelessWidget {
  final double onResultBalance;

  final double notOnResultBalance;

  const AccountsBalance(
      {Key? key,
      required this.onResultBalance,
      required this.notOnResultBalance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(onResultBalance.toCustomString() + ' руб.',
                    style: const TextStyle(
                        fontSize: 28 * 1.1,
                        fontFamily: 'Arial',
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text('Общий баланс:',
                    style: TextStyle(
                        color: HexColor('#B0B0B0'),
                        fontFamily: 'Arial',
                        fontSize: 13 * 1.2))),
            Text(notOnResultBalance.toCustomString() + ' руб.',
                style: TextStyle(
                    color: HexColor('#0088FF'),
                    fontFamily: 'Arial',
                    fontSize: 13 * 1.2))
          ],
        ));
  }
}
