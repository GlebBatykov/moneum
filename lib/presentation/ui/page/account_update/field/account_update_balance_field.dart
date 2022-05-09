import 'package:flutter/material.dart';
import 'package:moneum/presentation/ui/form/input_form.dart';

import '../../../update_field_title.dart';

class AccountUpdateBalanceField extends StatelessWidget {
  final TextEditingController editingController;

  const AccountUpdateBalanceField({Key? key, required this.editingController})
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
            const UpdateFieldTitle(
                title: 'Баланс', hint: 'Введите начальный баланс'),
            InputForm(
                editingController: editingController,
                width: 127,
                height: 33 * 1.2,
                hintText: '0')
          ],
        );
      }),
    );
  }
}
