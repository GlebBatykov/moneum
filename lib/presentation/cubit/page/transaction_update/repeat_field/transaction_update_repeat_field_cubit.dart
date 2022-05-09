import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/page/transaction_update/field/repeat/transaction_update_repeat_field_select_dialog_item_data.dart';
import '../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';

part 'transaction_update_repeat_field_state.dart';

class TransactionUpdateRepeatFieldCubit
    extends Cubit<TransactionUpdateRepeatFieldState> {
  late final SelectDialogListCubit<
      TransactionUpdateRepeatFieldSelectDialogItemData> _selectDialogCubit;

  late String _title;

  late bool _isRepeatEnabled;

  TransactionUpdateRepeatFieldCubit()
      : super(TransactionUpdateRepeatFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _isRepeatEnabled = false;

    _selectDialogCubit =
        SelectDialogListCubit<TransactionUpdateRepeatFieldSelectDialogItemData>(
            'Выберите периодичность', [
      TransactionUpdateRepeatFieldSelectDialogItemData('Без повторений'),
      TransactionUpdateRepeatFieldSelectDialogItemData('Ежедневно'),
      TransactionUpdateRepeatFieldSelectDialogItemData('Каждую неделю'),
      TransactionUpdateRepeatFieldSelectDialogItemData('Ежемесячно'),
    ], onSelect: (value, index) {
      _title = value.title;

      _show();

      Poseidon.instance.pop();
    });

    _title = _selectDialogCubit.selectedItem.title;

    _show();
  }

  void setRepeatEnabled(bool value) {
    _isRepeatEnabled = value;

    _show();
  }

  void _show() {
    emit(TransactionUpdateRepeatFieldShow(
        _isRepeatEnabled, _title, _selectDialogCubit));
  }
}
