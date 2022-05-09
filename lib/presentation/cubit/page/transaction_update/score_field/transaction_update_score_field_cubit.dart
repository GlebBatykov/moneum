import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/page/transaction_update/field/score/transaction_update_score_field_select_dialog_item_data.dart';
import '../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';

part 'transaction_update_score_field_state.dart';

class TransactionUpdateScoreFieldCubit
    extends Cubit<TransactionUpdateScoreFieldState> {
  late final SelectDialogListCubit<
      TransactionUpdateScoreFieldSelectDialogItemData> _selectDialogCubit;

  late String _title;

  TransactionUpdateScoreFieldCubit()
      : super(TransactionUpdateScoreFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _selectDialogCubit =
        SelectDialogListCubit<TransactionUpdateScoreFieldSelectDialogItemData>(
            'Выберите счет', [
      TransactionUpdateScoreFieldSelectDialogItemData('Наличные'),
      TransactionUpdateScoreFieldSelectDialogItemData('Дебетовая карта'),
      TransactionUpdateScoreFieldSelectDialogItemData('Электронный кошелек')
    ], onSelect: (value, index) {
      _title = value.title;

      _show();

      Poseidon.instance.pop();
    });

    _title = _selectDialogCubit.selectedItem.title;

    _show();
  }

  void _show() {
    emit(TransactionUpdateScoreFieldShow(_title, _selectDialogCubit));
  }
}
