import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moneum/presentation/model/page/account_update/field/currency/account_update_currency_field_select_dialog_item_data.dart';
import 'package:poseidon/poseidon.dart';

import '../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';

part 'account_update_currency_field_state.dart';

class AccountUpdateCurrencyFieldCubit
    extends Cubit<AccountUpdateCurrencyFieldState> {
  late final SelectDialogListCubit<
      AccountUpdateCurrencyFieldSelectDialogItemData> _selectDialogCubit;

  late String _shortTitle;

  AccountUpdateCurrencyFieldCubit()
      : super(AccountUpdateCurrencyFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _selectDialogCubit =
        SelectDialogListCubit<AccountUpdateCurrencyFieldSelectDialogItemData>(
            'Выберите валюту', [
      AccountUpdateCurrencyFieldSelectDialogItemData('Российский рубль', 'RUB'),
      AccountUpdateCurrencyFieldSelectDialogItemData('Евро', 'EUR'),
      AccountUpdateCurrencyFieldSelectDialogItemData('Доллар США', 'USD')
    ], onSelect: (value, index) {
      _shortTitle = value.shortTitle;

      _show();

      Poseidon.instance.pop();
    }, titleBuilder: (value) {
      return value.title + ' (' + value.shortTitle + ')';
    });

    _shortTitle = _selectDialogCubit.selectedItem.shortTitle;

    _show();
  }

  void _show() {
    emit(AccountUpdateCurrencyFieldShow(_shortTitle, _selectDialogCubit));
  }
}
