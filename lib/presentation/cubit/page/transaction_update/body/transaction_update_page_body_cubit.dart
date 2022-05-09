import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../category_field/transaction_update_category_field_cubit.dart';
import '../date_field/transaction_update_date_field_cubit.dart';
import '../repeat_field/transaction_update_repeat_field_cubit.dart';
import '../score_field/transaction_update_score_field_cubit.dart';
import '../sum_field/transaction_update_sum_field_cubit.dart';

part 'transaction_update_page_body_state.dart';

class TransactionUpdatePageBodyCubit
    extends Cubit<TransactionUpdatePageBodyState> {
  late final TransactionUpdateCategoryFieldCubit _categoryFieldCubit;

  late final TransactionUpdateDateFieldCubit _dateFieldCubit;

  late final TransactionUpdateRepeatFieldCubit _repeatFieldCubit;

  late final TransactionUpdateSumFieldCubit _sumFieldCubit;

  late final TransactionUpdateScoreFieldCubit _scoreFieldCubit;

  late final TextEditingController _commentEditingController;

  TransactionUpdatePageBodyCubit.add()
      : super(TransactionUpdatePageBodyInitial()) {
    _addInitialiaze();
  }

  TransactionUpdatePageBodyCubit.update()
      : super(TransactionUpdatePageBodyInitial()) {
    _updateInitialize();
  }

  void _addInitialiaze() {
    _categoryFieldCubit = TransactionUpdateCategoryFieldCubit();

    _dateFieldCubit = TransactionUpdateDateFieldCubit();

    _repeatFieldCubit = TransactionUpdateRepeatFieldCubit();

    _scoreFieldCubit = TransactionUpdateScoreFieldCubit();

    _sumFieldCubit = TransactionUpdateSumFieldCubit();

    _commentEditingController = TextEditingController();

    _show();
  }

  void _updateInitialize() {
    _categoryFieldCubit = TransactionUpdateCategoryFieldCubit();

    _dateFieldCubit = TransactionUpdateDateFieldCubit();

    _repeatFieldCubit = TransactionUpdateRepeatFieldCubit();

    _scoreFieldCubit = TransactionUpdateScoreFieldCubit();

    _sumFieldCubit = TransactionUpdateSumFieldCubit();

    _commentEditingController = TextEditingController();

    _show();
  }

  void _show() {
    emit(TransactionUpdatePageBodyShow(
        _categoryFieldCubit,
        _dateFieldCubit,
        _repeatFieldCubit,
        _scoreFieldCubit,
        _sumFieldCubit,
        _commentEditingController));
  }
}
