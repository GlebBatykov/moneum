import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import 'material_icon.dart';

class TitleBar extends StatelessWidget {
  final String title;

  final List<Widget>? rightActions;

  const TitleBar({Key? key, required this.title, this.rightActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
              bottom: BorderSide(color: Colors.white.withOpacity(0.15)))),
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 50,
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: constraints.maxWidth * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 5, right: 15),
                          child: MaterialIcon(
                            assetName: 'assets/images/icons/arrow-back.svg',
                            width: 16,
                            heigth: 12,
                            color: Colors.white,
                            onPressed: () {
                              Poseidon.instance.pop();
                            },
                          )),
                      Text(title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.bold,
                              fontSize: 18 * 1.15))
                    ],
                  )),
              SizedBox(
                  width: constraints.maxWidth * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [],
                  ))
            ],
          );
        }),
      ),
    );
  }
}
