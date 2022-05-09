import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/cubit/dialog/select_dialog_list/item/select_dialog_list_item_cubit.dart';

class SelectDialogListItem extends StatelessWidget {
  const SelectDialogListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectDialogListItemCubit, SelectDialogItemState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: state.onTap,
        child: Container(
          height: 40,
          width: 285,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 12),
          color: state is SelectDialogItemSelect
              ? Colors.white.withOpacity(0.15)
              : Colors.transparent,
          child: Text(state.title,
              style: TextStyle(
                  fontWeight: state is SelectDialogItemSelect
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: Colors.white)),
        ),
      );
    });
  }
}
