import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/cubit/page/accounts/dot_slider/accounts_dot_slider_cubit.dart';
import 'package:moneum/presentation/ui/page/accounts/dot_slider/accounts_dot.dart';

import '../../../../cubit/page/accounts/dot_slider/dot/accounts_dot_cubit.dart';

class AccountsDotSlider extends StatelessWidget {
  const AccountsDotSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsDotSliderCubit, AccountsDotSliderState>(
        builder: (context, state) {
      if (state is AccountsDotSliderShow) {
        return SizedBox(
          width: state.width,
          height: 6,
          child: Stack(
              children: state.dotsCubits
                  .map((e) => BlocProvider<AccountDotCubit>.value(
                      value: e, child: const AccountsDot()))
                  .toList()),
        );
      } else {
        return Container();
      }
    });
  }
}
