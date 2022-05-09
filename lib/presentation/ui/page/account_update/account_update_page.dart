import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/cubit/page/account_update/account_update_page_cubit.dart';
import 'package:moneum/presentation/ui/title_bar.dart';

import 'account_update_page_body.dart';

class AccountUpdatePage extends StatelessWidget {
  const AccountUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: BlocBuilder<AccountUpdatePageCubit, AccountUpdatePageState>(
          builder: (context, state) {
        if (state is AccountUpdatePageShow) {
          return Column(
            children: [
              TitleBar(
                title: state.title,
              ),
              Expanded(
                  child: BlocProvider.value(
                      value: state.bodyCubit,
                      child: const AccountUpdatePageBody()))
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
