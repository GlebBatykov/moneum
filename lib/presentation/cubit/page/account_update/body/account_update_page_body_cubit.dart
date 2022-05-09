import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moneum/domain/model/account.dart';
import 'package:moneum/presentation/cubit/page/account_update/conside_field/account_update_conside_field_cubit.dart';

import '../currency_field/account_update_currency_field_cubit.dart';

part 'account_update_page_body_state.dart';

class AccountUpdatePageBodyCubit extends Cubit<AccountUpdatePageBodyState> {
  final TextEditingController _textEditingController = TextEditingController();

  late final AccountUpdateCurrencyFieldCubit _updateCurrencyFieldCubit;

  final TextEditingController _balanceEditingController =
      TextEditingController();

  late final AccountUpdateConsideFieldCubit _updateConsideFieldCubit;

  AccountUpdatePageBodyCubit.add() : super(AccountUpdatePageBodyInitial()) {
    _addInitialize();
  }

  AccountUpdatePageBodyCubit.update(Account account)
      : super(AccountUpdatePageBodyInitial()) {
    _editInitialize();
  }

  void _addInitialize() {
    _updateCurrencyFieldCubit = AccountUpdateCurrencyFieldCubit();

    _updateConsideFieldCubit =
        AccountUpdateConsideFieldCubit(onToggle: (value) {});

    emit(AccountUpdatePageBodyShow(
        _textEditingController,
        _updateCurrencyFieldCubit,
        _balanceEditingController,
        _updateConsideFieldCubit));
  }

  void _editInitialize() {
    _updateCurrencyFieldCubit = AccountUpdateCurrencyFieldCubit();

    _updateConsideFieldCubit =
        AccountUpdateConsideFieldCubit(onToggle: (value) {});

    emit(AccountUpdatePageBodyShow(
        _textEditingController,
        _updateCurrencyFieldCubit,
        _balanceEditingController,
        _updateConsideFieldCubit));
  }
}
