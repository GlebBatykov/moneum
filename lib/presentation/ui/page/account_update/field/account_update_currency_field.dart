import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/ui/dialog/select_list/select_dialog_list.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../cubit/page/account_update/currency_field/account_update_currency_field_cubit.dart';
import '../../../button/select_button.dart';
import '../../../update_field_title.dart';

class AcccountUpdateCurrencyField extends StatelessWidget {
  final TextEditingController editingController;

  const AcccountUpdateCurrencyField({Key? key, required this.editingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountUpdateCurrencyFieldCubit,
        AccountUpdateCurrencyFieldState>(builder: (context, state) {
      if (state is AccountUpdateCurrencyFieldShow) {
        return Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UpdateFieldTitle(
                    title: 'Валюта', hint: 'Выберите валюту'),
                SelectButton(
                    width: 85 * 1.2,
                    height: 33 * 1.2,
                    onTap: () {
                      Poseidon.instance.callDialog((context) {
                        return SelectDialogList(cubit: state.selectDialogCubit);
                      });
                    },
                    title: state.shortTitle)
              ],
            ));
      } else {
        return Container();
      }
    });
  }
}
