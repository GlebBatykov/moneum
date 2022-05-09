import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/page/transaction_update/field/category/transaction_update_category_field_select_dialog_item_data.dart';
import '../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';

part 'transaction_update_category_field_state.dart';

class TransactionUpdateCategoryFieldCubit
    extends Cubit<TransactionUpdateCategoryFieldState> {
  late final String _title;

  late final SelectDialogListCubit<
      TransactionUpdateCategoryFieldSelectDialogItemData> _selectDialogCubit;

  TransactionUpdateCategoryFieldCubit()
      : super(TransactionUpdateCategoryFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _selectDialogCubit = SelectDialogListCubit<
            TransactionUpdateCategoryFieldSelectDialogItemData>(
        'Выбирите категорию',
        [TransactionUpdateCategoryFieldSelectDialogItemData('Без категории')],
        onSelect: (value, index) {
      _title = value.title;

      _show();

      Poseidon.instance.pop();
    });

    _title = _selectDialogCubit.selectedItem.title;

    _show();
  }

  void _show() {
    emit(TransactionUpdateCategoryFieldShow(_title, _selectDialogCubit));
  }
}
