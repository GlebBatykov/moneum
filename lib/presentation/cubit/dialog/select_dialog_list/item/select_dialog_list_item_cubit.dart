import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moneum/presentation/model/dialog/select_dialog_list_item_data.dart';

part 'select_dialog_list_item_state.dart';

class SelectDialogListItemCubit<T extends SelectDialogListItemData>
    extends Cubit<SelectDialogItemState> {
  final String _title;

  final void Function()? _onTap;

  bool _isSelected;

  SelectDialogListItemCubit(String title,
      {void Function()? onTap, bool isSelected = false})
      : _title = title,
        _onTap = onTap,
        _isSelected = isSelected,
        super(isSelected
            ? SelectDialogItemSelect(title, onTap)
            : SelectDialogItemUnselect(title, onTap));

  void select() {
    if (!_isSelected) {
      emit(SelectDialogItemSelect(_title, _onTap));

      _isSelected = true;
    }
  }

  void unselect() {
    if (_isSelected) {
      emit(SelectDialogItemUnselect(_title, _onTap));

      _isSelected = false;
    }
  }
}
