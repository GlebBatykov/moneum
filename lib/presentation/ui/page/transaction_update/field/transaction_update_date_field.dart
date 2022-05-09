import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/page/transaction_update/date_field/transaction_update_date_field_cubit.dart';
import '../../../update_field_title.dart';

class TransactionUpdateDateField extends StatelessWidget {
  const TransactionUpdateDateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var updateDateFieldCubit = context.watch<TransactionUpdateDateFieldCubit>();

    return BlocBuilder<TransactionUpdateDateFieldCubit,
            TransactionUpdateDateFieldState>(
        bloc: updateDateFieldCubit,
        builder: (context, state) {
          if (state is TransactionUpdateDateFieldShow) {
            return Container(
              margin: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UpdateFieldTitle(title: 'Дата', hint: 'Введите дату'),
                  Container(
                    width: 166,
                    height: 33,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () async {
                        int year = 0, month = 0, day = 0, hour = 0, minute = 0;

                        var now = DateTime.now();

                        var date = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(now.year),
                            lastDate: DateTime(2050));

                        var time = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());

                        if (date != null) {
                          year = date.year;
                          month = date.month;
                          day = date.day;
                        }

                        if (time != null) {
                          hour = time.hour;
                          minute = time.minute;
                        }

                        var dateTime = DateTime(year, month, day, hour, minute);

                        if (date != null || date != null) {
                          updateDateFieldCubit.change(dateTime);
                        }
                      },
                      child: Text(state.title,
                          style: const TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: Colors.white)),
                    ),
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
