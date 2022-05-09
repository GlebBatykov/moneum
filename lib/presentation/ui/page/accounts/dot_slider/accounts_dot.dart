import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/page/accounts/dot_slider/dot/accounts_dot_cubit.dart';

class AccountsDot extends StatelessWidget {
  const AccountsDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDotCubit, AccountDotState>(
        builder: (context, state) {
      return AnimatedPositioned(
          left: state.left,
          child: Align(
              child: AnimatedOpacity(
                  onEnd: state.onEnd,
                  opacity: state.isVisible ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: state is AccountDotSelect
                            ? Colors.white
                            : Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8)),
                  ))),
          duration: state.duration);
    });
  }
}
