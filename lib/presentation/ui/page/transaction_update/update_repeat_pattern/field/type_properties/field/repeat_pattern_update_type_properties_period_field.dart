import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../../../cubit/page/transaction_update/update_repeat_pattern/field/type_properties/field/period/repeat_pattern_update_type_properties_period_field_cubit.dart';
import '../../../../../../button/select_button.dart';
import '../../../../../../content_divider.dart';
import '../../../../../../dialog/select_list/select_dialog_list.dart';
import '../../../../../../update_field_title.dart';
import '../../../../../update/field/update_date_field.dart';
import '../../../../../update/field/update_value_field.dart';

class RepeatPatternUpdateTypePropertiesPeriodField extends StatelessWidget {
  const RepeatPatternUpdateTypePropertiesPeriodField({Key? key})
      : super(key: key);

  CrossFadeState _buildCrossFadeState(
      RepeatPatternUpdateTypePropertiesPeriodFieldShow state) {
    return state is RepeatPatternUpdateTypePropertiesPeriodFieldInfinity
        ? CrossFadeState.showFirst
        : CrossFadeState.showSecond;
  }

  Widget _buildSecondChild(
      RepeatPatternUpdateTypePropertiesPeriodFieldShow state) {
    if (state is RepeatPatternUpdateTypePropertiesPeriodFieldCount) {
      return Column(
        children: [
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 10)),
          UpdateValueField(
              title: 'N раз',
              hint: 'Введите кол-во исполнений',
              textAlign: TextAlign.right,
              editingController: state.countEditingController),
        ],
      );
    } else if (state is RepeatPatternUpdateTypePropertiesPeriodFieldDate) {
      return Column(
        children: [
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 10)),
          BlocProvider.value(
              value: state.dateFieldCubit, child: const UpdateDateField()),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepeatPatternUpdateTypePropertiesPeriodFieldCubit,
            RepeatPatternUpdateTypePropertiesPeriodFieldState>(
        builder: (context, state) {
      if (state is RepeatPatternUpdateTypePropertiesPeriodFieldShow) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UpdateFieldTitle(
                    title: 'Период', hint: 'Выберите период'),
                SelectButton(
                    height: 33 * 1.2,
                    onTap: () {
                      Poseidon.instance.callDialog((context) {
                        return SelectDialogList(cubit: state.selectDialogCubit);
                      });
                    },
                    title: state.title)
              ],
            ),
            AnimatedCrossFade(
                firstChild: Container(),
                secondChild: _buildSecondChild(state),
                crossFadeState: _buildCrossFadeState(state),
                duration: const Duration(milliseconds: 300))
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
