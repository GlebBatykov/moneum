import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/ui/update_field_title.dart';

class AccountUpdateTitleField extends StatelessWidget {
  final TextEditingController editingController;

  const AccountUpdateTitleField({Key? key, required this.editingController})
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
            const UpdateFieldTitle(title: 'Название', hint: 'Введите название'),
            Container(
              width: 171 * 1.1,
              height: 33 * 1.2,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8)),
              child: Form(
                  child: TextFormField(
                style: TextStyle(color: HexColor('#A4A4A4')),
                controller: editingController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Введите название',
                    hintStyle: TextStyle(
                        fontFamily: 'Arial',
                        color: HexColor('#A4A4A4'),
                        fontSize: 17),
                    border: InputBorder.none),
              )),
            )
          ],
        );
      }),
    );
  }
}
