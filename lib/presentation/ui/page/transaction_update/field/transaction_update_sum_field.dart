import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/page/transaction_update/sum_field/transaction_update_sum_field_cubit.dart';
import '../../../button/custom_text_button.dart';
import '../../../form/input_form.dart';
import '../../../type_operation_toggle_button/type_operation_toggle_button.dart';
import '../../../update_field_title.dart';

class TransactionUpdateSumField extends StatelessWidget {
  const TransactionUpdateSumField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionUpdateSumFieldCubit,
        TransactionUpdateSumFieldState>(builder: (context, state) {
      if (state is TransactionUpdateSumFieldShow) {
        return Container(
          margin: const EdgeInsets.only(top: 6, bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const UpdateFieldTitle(
                    title: 'Сумма',
                    hint: 'Выберите тип операции и введите сумму.'),
              ),
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: BlocProvider.value(
                      value: state.toggleButtonCubit,
                      child: const TypeOperationToggleButton()),
                ),
                Expanded(
                    child: InputForm(
                  editingController: state.editingController,
                  textAlign: TextAlign.right,
                  width: 127,
                  height: 33 * 1.2,
                  hintText: '0',
                )),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: CustomTextButton(
                      text: 'Калькулятор',
                      onTap: () {},
                      margin: const EdgeInsets.only(left: 8, right: 8)),
                )
              ])
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
