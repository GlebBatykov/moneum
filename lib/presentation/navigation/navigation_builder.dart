import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/domain/model/account.dart';
import 'package:moneum/domain/model/transaction.dart';
import 'package:moneum/presentation/cubit/page/transaction_update/transaction_update_page_cubit.dart';
import 'package:moneum/presentation/ui/page/transaction_update/transaction_update_page.dart';
import 'package:poseidon/poseidon.dart';

import '../cubit/page/account_update/account_update_page_cubit.dart';
import '../ui/page/account_update/account_update_page.dart';

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
    ]);
  }
}
