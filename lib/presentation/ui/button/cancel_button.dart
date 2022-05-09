import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final void Function()? onPressed;

  const CancelButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all(Colors.white.withOpacity(0.15)),
            fixedSize:
                MaterialStateProperty.all(const Size(111 * 1.1, 36 * 1.1))),
        onPressed: onPressed,
        child: const Text('Отмена',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
                fontSize: 13 * 1.1,
                fontWeight: FontWeight.bold)));
  }
}
