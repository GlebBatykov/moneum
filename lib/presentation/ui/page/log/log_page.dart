import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moneum/presentation/cubit/page/log_page/log_page_cubit.dart';
import 'package:moneum/presentation/ui/page/log/log_item.dart';

class LogPage extends StatelessWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logPageCubit = GetIt.instance<LogPageCubit>();

    return BlocBuilder<LogPageCubit, LogPageState>(
        bloc: logPageCubit,
        builder: (context, state) {
          if (state is LogPageShow) {
            return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();

                  return true;
                },
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.itemsCubits.length,
                    itemBuilder: (context, index) {
                      return BlocProvider.value(
                          value: state.itemsCubits[index],
                          child: const LogItem());
                    }));
          } else {
            return Container();
          }
        });
  }
}
