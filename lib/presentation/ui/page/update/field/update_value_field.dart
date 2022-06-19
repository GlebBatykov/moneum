import 'package:flutter/material.dart';

import '../../../form/input_form.dart';
import '../../../update_field_title.dart';

class UpdateValueField extends StatelessWidget {
  final String title;

  final String hint;

  final String? hintText;

  final TextAlign? textAlign;

  final TextEditingController editingController;

  const UpdateValueField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.editingController,
      this.textAlign,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, bottom: 6),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UpdateFieldTitle(title: title, hint: hint),
            InputForm(
                editingController: editingController,
                width: 127,
                height: 33 * 1.2,
                textAlign: textAlign ?? TextAlign.left,
                hintText: hintText)
          ],
        );
      }),
    );
  }
}
