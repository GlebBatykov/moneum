import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import 'cancel_button.dart';
import 'save_button.dart';

class UpdateButtons extends StatelessWidget {
  final void Function()? onSave;

  const UpdateButtons({Key? key, this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CancelButton(onPressed: () {
          Poseidon.instance.pop();
        }),
        SaveButton(onTap: onSave),
      ],
    );
  }
}
