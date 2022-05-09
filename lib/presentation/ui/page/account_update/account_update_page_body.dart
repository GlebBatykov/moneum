import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/ui/page/account_update/field/account_update_conside_field.dart';

import '../../../cubit/page/account_update/body/account_update_page_body_cubit.dart';
import '../../content_divider.dart';
import '../../button/update_buttons.dart';
import 'field/account_update_balance_field.dart';
import 'field/account_update_currency_field.dart';
import 'field/account_update_title_field.dart';

class AccountUpdatePageBody extends StatelessWidget {
  const AccountUpdatePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountUpdatePageBodyCubit, AccountUpdatePageBodyState>(
        builder: (context, state) {
      if (state is AccountUpdatePageBodyShow) {
        return Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 15),
          child: Column(
            children: [
              AccountUpdateTitleField(
                  editingController: state.titleEditingController),
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 10)),
              BlocProvider.value(
                  value: state.updateCurrencyFieldCubit,
                  child: AcccountUpdateCurrencyField(
                      editingController: TextEditingController())),
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 10)),
              AccountUpdateBalanceField(
                  editingController: state.balanceEditingController),
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 10)),
              BlocProvider.value(
                  value: state.updateConsideFieldCubit,
                  child: const AccountUpdateConsideField()),
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 20)),
              const UpdateButtons()
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
