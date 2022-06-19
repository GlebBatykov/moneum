import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/transaction_update/body/transaction_update_page_body_cubit.dart';
import '../../button/update_buttons.dart';
import '../../content_divider.dart';
import '../update/update_page_body.dart';
import 'field/transaction_update_category_field.dart';
import 'field/transaction_update_comment_field.dart';
import '../update/field/update_date_field.dart';
import 'field/transaction_update_repeat_field.dart';
import 'field/transaction_update_score_field.dart';
import 'field/transaction_update_sum_field.dart';

class TransactionUpdatePageBody extends StatelessWidget {
  const TransactionUpdatePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionUpdatePageBodyCubit,
        TransactionUpdatePageBodyState>(builder: (context, state) {
      if (state is TransactionUpdatePageBodyShow) {
        return UpdatePageBody(children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: BlocProvider.value(
                value: state.dateFieldCubit, child: const UpdateDateField()),
          ),
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 10)),
          BlocProvider.value(
              value: state.scoreFieldCubit,
              child: const TransactionUpdateScoreField()),
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 10)),
          BlocProvider.value(
              value: state.categoryFieldCubit,
              child: const TransactionUpdateCategoryField()),
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 10)),
          BlocProvider.value(
              value: state.sumFieldCubit,
              child: const TransactionUpdateSumField()),
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 10)),
          TransactionUpdateCommentField(
              editingController: state.commentEditingController),
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 10)),
          BlocProvider.value(
              value: state.repeatFieldCubit,
              child: const TransactionUpdateRepeatField()),
          const ContentDivider(margin: EdgeInsets.only(top: 10, bottom: 20)),
          const UpdateButtons()
        ]);
      } else {
        return Container();
      }
    });
  }
}
