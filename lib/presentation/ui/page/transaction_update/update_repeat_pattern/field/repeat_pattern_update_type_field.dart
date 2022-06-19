import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../cubit/page/transaction_update/update_repeat_pattern/field/repeat_pattern_update_type_field_cubit.dart';
import '../../../../button/select_button.dart';
import '../../../../dialog/select_list/select_dialog_list.dart';
import '../../../../update_field_title.dart';

class RepeatPatternUpdateTypeField extends StatelessWidget {
  const RepeatPatternUpdateTypeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepeatPatternUpdateTypeFieldCubit,
        RepeatPatternUpdateTypeFieldState>(builder: (context, state) {
      if (state is RepeatPatternUpdateTypeFieldShow) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const UpdateFieldTitle(title: 'Повторения', hint: 'Выберите тип'),
            SelectButton(
                height: 33 * 1.2,
                onTap: () {
                  Poseidon.instance.callDialog((context) {
                    return SelectDialogList(cubit: state.selectDialogCubit);
                  });
                },
                title: state.title)
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
