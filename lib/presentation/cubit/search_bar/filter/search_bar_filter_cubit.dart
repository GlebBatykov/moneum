import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moneum/presentation/cubit/search_bar/filter/category/search_bar_filter_period_category_cubit.dart';
import 'package:moneum/presentation/cubit/search_bar/filter/category/search_bar_filter_sum_category_cubit.dart';

import 'category/search_bar_filter_category_cubit.dart';
import 'category/search_bar_filter_operation_category_cubit.dart';
import 'category/search_bar_filter_score_category_cubit.dart';

part 'search_bar_filter_state.dart';

class SearchBarFilterCubit extends Cubit<SearchBarFilterState> {
  late final SearchBarFilterOperationCategoryCubit _operationCategoryCubit;

  late final SearchBarFilterPeriodCategoryCubit _periodCategoryCubit;

  late final SearchBarFitlerScoreCategoryCubit _scoreCategoryCubit;

  late final SearchBarFilterSumCategoryCubit _sumCategoryCubit;

  OperationType? get operationType => _operationCategoryCubit.type;

  PeriodType? get periodType => _periodCategoryCubit.type;

  ScoreType? get scoreType => _scoreCategoryCubit.type;

  double? get sumBegin => _sumCategoryCubit.begin;

  double? get sumEnd => _sumCategoryCubit.end;

  SearchBarFilterCubit() : super(SearchBarFilterInitial()) {
    _initialize();
  }

  void _initialize() {
    _operationCategoryCubit = SearchBarFilterOperationCategoryCubit(
        'Тип операции', 145, 20, const EdgeInsets.only(right: 5));

    _periodCategoryCubit = SearchBarFilterPeriodCategoryCubit(
        'Период', 98, 20, const EdgeInsets.only(right: 5, left: 5));

    _scoreCategoryCubit = SearchBarFitlerScoreCategoryCubit(
        'Счет', 79, 20, const EdgeInsets.only(right: 5, left: 5));

    _sumCategoryCubit = SearchBarFilterSumCategoryCubit(
        'Сумма', 90, 20, const EdgeInsets.only(left: 5));

    emit(SearchBarFilterShow([
      _operationCategoryCubit,
      _periodCategoryCubit,
      _scoreCategoryCubit,
      _sumCategoryCubit
    ]));
  }
}
