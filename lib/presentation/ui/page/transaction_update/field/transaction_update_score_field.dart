import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../cubit/page/transaction_update/score_field/transaction_update_score_field_cubit.dart';
import '../../../button/select_button.dart';
import '../../../dialog/select_list/select_dialog_list.dart';
import '../../../update_field_title.dart';

class TransactionUpdateScoreField extends StatelessWidget {
  const TransactionUpdateScoreField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionUpdateScoreFieldCubit,
        TransactionUpdateScoreFieldState>(builder: (context, state) {
      if (state is TransactionUpdateScoreFieldShow) {
        return Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UpdateFieldTitle(title: 'Счет', hint: 'Выберите счет'),
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
