import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/navigation/update_repeat_pattern_arguments.dart';
import 'package:moneum/presentation/ui/button/custom_text_button.dart';
import 'package:moneum/presentation/ui/button/select_button.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../cubit/page/transaction_update/repeat_field/transaction_update_repeat_field_cubit.dart';
import '../../../button/switch_button.dart';
import '../../../content_divider.dart';
import '../../../dialog/select_list/select_dialog_list.dart';
import '../../../rounded_material_button.dart';
import '../../../update_field_title.dart';

class TransactionUpdateRepeatField extends StatelessWidget {
  const TransactionUpdateRepeatField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repeatFieldCubit = context.watch<TransactionUpdateRepeatFieldCubit>();

    return BlocBuilder<TransactionUpdateRepeatFieldCubit,
            TransactionUpdateRepeatFieldState>(
        bloc: repeatFieldCubit,
        builder: (context, state) {
          if (state is TransactionUpdateRepeatFieldShow) {
            return Container(
                margin: const EdgeInsets.only(top: 6, bottom: 6),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UpdateFieldTitle(
                            title: 'Вкл. повторения',
                            hint: 'Включить повторения'),
                        SwitchButton(
                            value: state.isRepeatEnabled,
                            onToggle: (value) {
                              repeatFieldCubit.setRepeatEnabled(value);
                            })
                      ],
                    ),
                    AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Column(
                          children: [
                            const ContentDivider(
                                margin: EdgeInsets.only(top: 10, bottom: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const UpdateFieldTitle(
                                    title: 'Повторения', hint: 'Выбранный тип'),
                                RoundedMaterialButton(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      height: 33 * 1.2,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            left: 12, right: 18),
                                        child: Text(state.title,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Arial',
                                                color: Colors.white)),
                                      ),
                                    ))
                              ],
                            ),
                            const ContentDivider(
                                margin: EdgeInsets.only(top: 10, bottom: 10)),
                            CustomTextButton(
                                text: 'Настроить повторения',
                                onTap: () {
                                  Poseidon.instance.navigate(
                                      '/edit-transaction/update-repeat-pettern',
                                      arguments: UpdateRepeatPatternArguments(
                                          state.pattern, state.onSave));
                                },
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 15)),
                          ],
                        ),
                        crossFadeState: state.isRepeatEnabled
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300))
                  ],
                ));
          } else {
            return Container();
          }
        });
  }
}
