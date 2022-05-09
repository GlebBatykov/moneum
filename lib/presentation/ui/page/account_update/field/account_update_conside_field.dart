import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/cubit/page/account_update/conside_field/account_update_conside_field_cubit.dart';
import 'package:moneum/presentation/ui/button/switch_button.dart';

import '../../../update_field_title.dart';

class AccountUpdateConsideField extends StatelessWidget {
  const AccountUpdateConsideField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountUpdateConsideFieldCubit =
        context.watch<AccountUpdateConsideFieldCubit>();

    return Container(
      margin: const EdgeInsets.only(top: 6, bottom: 6),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const UpdateFieldTitle(
                title: 'Учитывать', hint: 'Включить в общий итог'),
            BlocBuilder<AccountUpdateConsideFieldCubit,
                    AccountUpdateConsideFieldState>(
                bloc: accountUpdateConsideFieldCubit,
                builder: (context, state) {
                  return SwitchButton(
                      value: state is AccountUpdateConsideFieldActive,
                      onToggle: (value) {
                        accountUpdateConsideFieldCubit.changeState(value);

                        state.onToggle?.call(value);
                      });
                })
          ],
        );
      }),
    );
  }
}
