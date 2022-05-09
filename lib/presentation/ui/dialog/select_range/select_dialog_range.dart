import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/cubit/dialog/select_dialog_range/select_dialog_range_cubit.dart';
import 'package:moneum/presentation/ui/dialog/select_range/select_dialog_range_buttons.dart';
import 'package:moneum/presentation/ui/dialog/select_range/select_dialog_range_item.dart';

import '../../content_divider.dart';

class SelectDialogRange extends StatelessWidget {
  final SelectDialogRangeCubit cubit;

  const SelectDialogRange({Key? key, required this.cubit}) : super(key: key);

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
            child: BlocBuilder<SelectDialogRangeCubit, SelectDialogRangeState>(
                builder: (context, state) {
              if (state is SelectDialogRangeShow) {
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
                        child: Container(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 15),
                      child: Column(
                        children: [
                          SelectDialogRangeItem(
                              title: 'От',
                              editingController: state.beginEditingController),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: SelectDialogRangeItem(
                                title: 'До',
                                editingController: state.endEditingController),
                          )
                        ],
                      ),
                    )),
                    const ContentDivider(),
                    SelectDialogRangeButtons(cubit: cubit)
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
