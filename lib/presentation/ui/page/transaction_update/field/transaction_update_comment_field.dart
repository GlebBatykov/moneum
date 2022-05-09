import 'package:flutter/material.dart';

import '../../../form/input_form.dart';
import '../../../update_field_title.dart';

class TransactionUpdateCommentField extends StatelessWidget {
  final TextEditingController editingController;

  const TransactionUpdateCommentField(
      {Key? key, required this.editingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        margin: const EdgeInsets.only(top: 6, bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const UpdateFieldTitle(
                  title: 'Комментарий',
                  hint: 'Оставьте здесь свой комментарий.'),
            ),
            Expanded(
                child: InputForm(
              editingController: editingController,
              textAlign: TextAlign.left,
              maxLength: 512,
              maxLines: null,
              contentPadding: const EdgeInsets.only(top: 1),
              hintText: 'Ваш комментарий',
            ))
          ],
        ));
  }
}
