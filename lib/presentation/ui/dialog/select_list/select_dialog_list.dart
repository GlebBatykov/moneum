import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/ui/content_divider.dart';
import 'package:moneum/presentation/ui/dialog/select_list/select_dialog_list_item.dart';

import '../../../cubit/dialog/select_dialog_list/select_dialog_list_cubit.dart';
import '../../../cubit/dialog/select_dialog_list/item/select_dialog_list_item_cubit.dart';

class SelectDialogList extends StatelessWidget {
  final SelectDialogListCubit cubit;

  const SelectDialogList({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            width: 285,
            height: 350,
            decoration: BoxDecoration(
                color: HexColor('#262626'),
                borderRadius: BorderRadius.circular(8)),
            child: BlocBuilder<SelectDialogListCubit, SelectDialogListState>(
                builder: (context, state) {
              if (state is SelectDialogListShow) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(state.title,
                          style: const TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    const ContentDivider(),
                    Expanded(
                        child: ListView.builder(
                            itemCount: state.itemCubits.length,
                            itemBuilder: ((context, index) {
                              return BlocProvider<
                                      SelectDialogListItemCubit>.value(
                                  value: state.itemCubits[index],
                                  child: const SelectDialogListItem());
                            }))),
                    const ContentDivider(),
                    state.bottomButtonType ==
                            SelectDialogCubitBottomButtonType.add
                        ? Container(
                            height: 45,
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text('Добавить',
                                    style: TextStyle(color: Colors.white))),
                          )
                        : Container(
                            height: 45,
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text('Отмена',
                                    style: TextStyle(color: Colors.white))),
                          )
                  ],
                );
              } else {
                return Container();
              }
            }),
          ),
        ));
  }
}
