import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../../domain/model/account.dart';
import '../../domain/model/transaction.dart';
import '../cubit/page/account_update/account_update_page_cubit.dart';
import '../cubit/page/transaction_update/transaction_update_page_cubit.dart';
import '../cubit/page/transaction_update/update_repeat_pattern/update_repeat_pattern_page_cubit.dart';
import '../ui/page/account_update/account_update_page.dart';
import '../ui/page/transaction_update/transaction_update_page.dart';
import '../ui/page/transaction_update/update_repeat_pattern/update_repeat_pattern_page.dart';
import 'update_repeat_pattern_arguments.dart';

class NavigationBuilder {
  void build() {
    var poseidon = Poseidon.instance;

    poseidon.createRoutes(routes: [
      PoseidonRoute(
          path: '/add-account',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => AccountUpdatePageCubit.add(),
                    child: const AccountUpdatePage()));
          }),
      PoseidonRoute(
          path: '/edit-account',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) =>
                        AccountUpdatePageCubit.update(Account()),
                    child: const AccountUpdatePage()));
          }),
      PoseidonRoute(
          path: '/add-transaction',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => TransactionUpdatePageCubit.add(),
                    child: const TransactionUpdatePage()));
          }),
      PoseidonRoute(
          path: '/edit-transaction',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) =>
                        TransactionUpdatePageCubit.update(Transaction()),
                    child: const TransactionUpdatePage()));
          }),
      PoseidonRoute<UpdateRepeatPatternArguments>(
          path: '/edit-transaction/update-repeat-pettern',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => UpdateRepeatPatternPageCubit(
                        arguments.onSave, arguments.pattern),
                    child: const UpdateRepeatPatternPage()));
          })
    ]);
  }
}
