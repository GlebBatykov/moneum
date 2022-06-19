import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/page/transaction_update/update_repeat_pattern/update_repeat_pattern_page_cubit.dart';
import '../../../../model/page/transaction_update/field/repeat/repeat_type.dart';
import '../../../button/update_buttons.dart';
import '../../../content_divider.dart';
import '../../update/update_page_body.dart';
import 'field/repeat_pattern_update_type_field.dart';
import 'field/type_properties/repeat_pattern_update_type_properties.dart';

class UpdateRepeatPatternPageBody extends StatelessWidget {
  const UpdateRepeatPatternPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var updateRepeatPatternPageCubit =
        context.watch<UpdateRepeatPatternPageCubit>();

    return BlocBuilder<UpdateRepeatPatternPageCubit,
            UpdateRepeatPatternPageState>(
        bloc: updateRepeatPatternPageCubit,
        builder: (context, state) {
          if (state is UpdateRepeatPatternPageShow) {
            return UpdatePageBody(children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: BlocProvider.value(
                    value: state.typeFieldCubit,
                    child: const RepeatPatternUpdateTypeField()),
              ),
              AnimatedCrossFade(
                  firstChild: Container(),
                  secondChild: BlocProvider.value(
                      value: state.typePropertiesCubit,
                      child: const RepeatPatternUpdateTypeProperties()),
                  crossFadeState:
                      state.typeFieldCubit.type != RepeatType.withoutRepeat
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300)),
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 20)),
              UpdateButtons(onSave: () {
                updateRepeatPatternPageCubit.save();
              })
            ]);
          } else {
            return Container();
          }
        });
  }
}
