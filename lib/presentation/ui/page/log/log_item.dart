import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:moneum/domain/extension/double_extension.dart';
import 'package:moneum/presentation/cubit/page/log_page/item/log_item_cubit.dart';

class LogItem extends StatelessWidget {
  const LogItem({Key? key}) : super(key: key);

  String _buildDate(DateTime date) {
    return date.day.toString() +
        ' ' +
        DateFormat.MMMM().format(date) +
        ' ' +
        date.year.toString() +
        '  ' +
        date.hour.toString() +
        ':' +
        date.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(builder: (context, state) {
      if (state is LogItemShow) {
        return Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(state.title,
                          style: TextStyle(
                              color: HexColor('#B0B0B0'),
                              fontFamily: 'Arial',
                              fontSize: 13 * 1.2))),
                  Text(
                      state.category +
                          (state.comment != null
                              ? ' (' + state.comment! + ')'
                              : ''),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          fontSize: 14 * 1.2))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(_buildDate(state.date),
                          style: TextStyle(
                              color: HexColor('#B0B0B0'),
                              fontFamily: 'Arial',
                              fontSize: 13 * 1.2))),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(state.value.toCustomString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontSize: 14 * 1.2,
                              fontWeight: FontWeight.bold))),
                  Text('Остаток: ' + state.remains.toCustomString(),
                      style: TextStyle(
                          color: HexColor('#B0B0B0'),
                          fontFamily: 'Arial',
                          fontSize: 13 * 1.2))
                ],
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
