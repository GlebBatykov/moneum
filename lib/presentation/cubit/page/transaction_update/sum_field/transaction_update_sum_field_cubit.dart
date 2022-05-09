import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../type_operation_toggle_button/type_operation_toggle_button_cubit.dart';

part 'transaction_update_sum_field_state.dart';

class TransactionUpdateSumFieldCubit
    extends Cubit<TransactionUpdateSumFieldState> {
  late final TextEditingController _editingController;

  late final TypeOperationToggleButtonCubit _toggleButtonCubit;

  TransactionUpdateSumFieldCubit() : super(TransactionUpdateSumFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _toggleButtonCubit = TypeOperationToggleButtonCubit();

    _editingController = TextEditingController();

    emit(TransactionUpdateSumFieldShow(_toggleButtonCubit, _editingController));
  }
}
