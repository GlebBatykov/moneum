import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SaveButton extends StatelessWidget {
  final void Function()? onTap;

  const SaveButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 10)
      ], borderRadius: BorderRadius.circular(8), color: Colors.transparent),
      alignment: Alignment.center,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: onTap,
              child: SizedBox(
                width: 189 * 1.1,
                height: 36 * 1.1,
                child: Center(
                  child: Text('Сохранить',
                      style: TextStyle(
                          color: HexColor('#3D3E41'),
                          fontFamily: 'Arial',
                          fontSize: 13 * 1.1,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          )),
    );
  }
}
