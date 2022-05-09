import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../cubit/page/transaction_update/category_field/transaction_update_category_field_cubit.dart';
import '../../../button/select_button.dart';
import '../../../dialog/select_list/select_dialog_list.dart';
import '../../../update_field_title.dart';

class TransactionUpdateCategoryField extends StatelessWidget {
  const TransactionUpdateCategoryField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionUpdateCategoryFieldCubit,
        TransactionUpdateCategoryFieldState>(builder: (context, state) {
      if (state is TransactionUpdateCategoryFieldShow) {
        return Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UpdateFieldTitle(
                    title: 'Категория', hint: 'Выберите категорию'),
                SelectButton(
                    height: 33 * 1.2,
                    onTap: () {
                      Poseidon.instance.callDialog((context) {
                        return SelectDialogList(cubit: state.selectDialogCubit);
                      });
                    },
                    title: state.title)
              ],
            ));
      } else {
        return Container();
      }
    });
  }
}
