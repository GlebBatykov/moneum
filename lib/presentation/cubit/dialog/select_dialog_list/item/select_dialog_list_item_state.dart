part of 'select_dialog_list_item_cubit.dart';

@immutable
abstract class SelectDialogItemState {
  final String title;

  final void Function()? onTap;

  const SelectDialogItemState(this.title, this.onTap);
}

class SelectDialogItemSelect extends SelectDialogItemState {
  const SelectDialogItemSelect(String title, void Function()? onTap)
      : super(title, onTap);
}

class SelectDialogItemUnselect extends SelectDialogItemState {
  const SelectDialogItemUnselect(String title, void Function()? onTap)
      : super(title, onTap);
}
