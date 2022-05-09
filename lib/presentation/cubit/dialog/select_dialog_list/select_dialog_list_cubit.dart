import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moneum/presentation/model/dialog/select_dialog_list_item_data.dart';

import 'item/select_dialog_list_item_cubit.dart';

part 'select_dialog_list_state.dart';

enum SelectDialogCubitBottomButtonType { add, cancel }

typedef SelectDialogItemTitleBuilderCallback<T> = String Function(T);

class SelectDialogListCubit<T extends SelectDialogListItemData>
    extends Cubit<SelectDialogListState> {
  final String _title;

  final List<T> _itemData;

  final List<SelectDialogListItemCubit> _itemCubits = [];

  final SelectDialogItemTitleBuilderCallback<T>? _titleBuilder;

  final void Function(T data, int index)? _onSelect;

  final int _selected;

  final SelectDialogCubitBottomButtonType _bottomButtonType;

  T get selectedItem => _itemData[_selected];

  SelectDialogListCubit(String title, List<T> itemData,
      {void Function(T data, int index)? onSelect,
      SelectDialogItemTitleBuilderCallback<T>? titleBuilder,
      int selected = 0,
      SelectDialogCubitBottomButtonType bottomButtonType =
          SelectDialogCubitBottomButtonType.add})
      : _title = title,
        _itemData = itemData,
        _onSelect = onSelect,
        _selected = selected,
        _titleBuilder = titleBuilder,
        _bottomButtonType = bottomButtonType,
        super(SelectDialogListInitial()) {
    _initialize();
  }

  void _initialize() {
    for (var i = 0; i < _itemData.length; i++) {
      var title = _titleBuilder != null
          ? _titleBuilder!(_itemData[i])
          : _itemData[i].title;

      _itemCubits.add(SelectDialogListItemCubit(title, onTap: () {
        selectItem(i);

        _onSelect?.call(_itemData[i], i);
      }, isSelected: i == _selected));
    }

    emit(SelectDialogListShow(_title, _itemCubits, _bottomButtonType));
  }

  void selectItem(int index) {
    for (var i = 0; i < _itemCubits.length; i++) {
      if (i != index) {
        _itemCubits[i].unselect();
      } else {
        _itemCubits[i].select();
      }
    }
  }

  @override
  Future<void> close() {
    for (var element in _itemCubits) {
      element.close();
    }

    return super.close();
  }
}
