part of 'select_dialog_list_cubit.dart';

@immutable
abstract class SelectDialogListState {}

class SelectDialogListInitial extends SelectDialogListState {}

class SelectDialogListShow extends SelectDialogListState {
  final String title;

  final List<SelectDialogListItemCubit> itemCubits;

  final SelectDialogCubitBottomButtonType bottomButtonType;

  SelectDialogListShow(this.title, this.itemCubits, this.bottomButtonType);
}
