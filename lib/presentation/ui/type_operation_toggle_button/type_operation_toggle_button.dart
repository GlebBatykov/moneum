import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../cubit/search_bar/filter/category/search_bar_filter_operation_category_cubit.dart';
import '../../cubit/type_operation_toggle_button/type_operation_toggle_button_cubit.dart';

class TypeOperationToggleButton extends StatelessWidget {
  const TypeOperationToggleButton({Key? key}) : super(key: key);

  Alignment _buildAligment(OperationType type) {
    return type == OperationType.income
        ? Alignment.centerLeft
        : Alignment.centerRight;
  }

  Color _buildPlusColor(OperationType type) {
    return type == OperationType.income
        ? HexColor('#00FF90')
        : Colors.white.withOpacity(0.15);
  }

  Color _buildMinusColor(OperationType type) {
    return type == OperationType.consumption
        ? Colors.red
        : Colors.white.withOpacity(0.15);
  }

  @override
  Widget build(BuildContext context) {
    var toggleButtonCubit = context.watch<TypeOperationToggleButtonCubit>();

    return BlocBuilder<TypeOperationToggleButtonCubit,
            TypeOperationToggleButtonState>(
        bloc: toggleButtonCubit,
        builder: (context, state) {
          if (state is TypeOperationToggleButtonShow) {
            return GestureDetector(
              child: Container(
                width: 61 * 1.2,
                height: 33 * 1.2,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8)),
                child: LayoutBuilder(builder: ((context, constraints) {
                  return Stack(
                    children: [
                      AnimatedAlign(
                        alignment: _buildAligment(state.type),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: Container(
                            width: constraints.maxWidth * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8))),
                        onEnd: state.onEnd,
                      ),
                      Positioned.fill(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: constraints.maxWidth * 0.5,
                              child: SvgPicture.asset(
                                'assets/images/type-operation-toggle-button/plus.svg',
                                width: 16,
                                height: 28,
                                color: _buildPlusColor(state.type),
                              )),
                          SizedBox(
                              width: constraints.maxWidth * 0.5,
                              child: SvgPicture.asset(
                                'assets/images/type-operation-toggle-button/minus.svg',
                                width: 16,
                                height: 31,
                                color: _buildMinusColor(state.type),
                              ))
                        ],
                      ))
                    ],
                  );
                })),
              ),
              onTap: () {
                toggleButtonCubit.change();
              },
            );
          } else {
            return Container();
          }
        });
  }
}
