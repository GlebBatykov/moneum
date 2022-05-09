import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/transaction_update/transaction_update_page_cubit.dart';
import '../../title_bar.dart';
import 'transaction_update_page_body.dart';

class TransactionUpdatePage extends StatelessWidget {
  const TransactionUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: BlocBuilder<TransactionUpdatePageCubit, TransactionUpdatePageState>(
          builder: (context, state) {
        if (state is TransactionUpdatePageShow) {
          return Column(
            children: [
              TitleBar(
                title: state.title,
              ),
              Expanded(
                  child: BlocProvider.value(
                      value: state.bodyCubit,
                      child: const TransactionUpdatePageBody()))
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
