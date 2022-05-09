import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/cubit/dialog/select_dialog_range/select_dialog_range_cubit.dart';
import 'package:moneum/presentation/ui/content_divider.dart';

class SelectDialogRangeButtons extends StatelessWidget {
  final SelectDialogRangeCubit cubit;

  const SelectDialogRangeButtons({Key? key, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: LayoutBuilder(builder: ((context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 45,
              width: constraints.maxWidth * 0.48,
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Отмена',
                      style: TextStyle(color: Colors.white))),
            ),
            const ContentDivider(
              axis: Axis.vertical,
              margin: EdgeInsets.only(left: 5, right: 5),
            ),
            Container(
              height: 45,
              width: constraints.maxWidth * 0.48,
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    cubit.select();
                  },
                  child: Text('Продолжить',
                      style: TextStyle(color: HexColor('#0088FF')))),
            )
          ],
        );
      })),
    );
  }
}
