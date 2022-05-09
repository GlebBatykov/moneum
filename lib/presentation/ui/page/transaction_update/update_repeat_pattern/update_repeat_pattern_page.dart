import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/page/transaction_update/update_repeat_pattern/update_repeat_pattern_page_cubit.dart';
import '../../../title_bar.dart';
import 'update_repeat_pattern_page_body.dart';

class UpdateRepeatPatternPage extends StatelessWidget {
  const UpdateRepeatPatternPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: BlocBuilder<UpdateRepeatPatternPageCubit,
          UpdateRepeatPatternPageState>(builder: (context, state) {
        if (state is UpdateRepeatPatternPageShow) {
          return Column(
            children: const [
              TitleBar(
                title: 'Настройки повторения',
              ),
              Expanded(child: UpdateRepeatPatternPageBody())
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
