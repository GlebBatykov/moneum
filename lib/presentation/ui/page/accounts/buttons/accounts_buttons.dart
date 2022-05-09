import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import 'accounts_button.dart';

class AccountsButtons extends StatelessWidget {
  const AccountsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AccountsButton(
            title: 'Изменить',
            assetPath: 'assets/images/account/icons/pencil.svg',
            onTap: () {
              Poseidon.instance.navigate('/edit-account');
            }),
        AccountsButton(
            title: 'Добавить',
            assetPath: 'assets/images/account/icons/list.svg',
            onTap: () {}),
        AccountsButton(
            title: 'Перевод',
            assetPath: 'assets/images/account/icons/transaction.svg',
            onTap: () {}),
        AccountsButton(
            title: 'Удалить',
            assetPath: 'assets/images/account/icons/trash.svg',
            onTap: () {})
      ],
    );
  }
}
