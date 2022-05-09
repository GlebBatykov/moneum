import 'package:flutter/material.dart';

import 'cancel_button.dart';
import 'save_button.dart';

class UpdateButtons extends StatelessWidget {
  const UpdateButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CancelButton(),
        SaveButton(),
      ],
    );
  }
}
