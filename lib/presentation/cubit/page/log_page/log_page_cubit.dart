import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moneum/presentation/cubit/page/log_page/item/log_item_cubit.dart';
import 'package:moneum/presentation/cubit/search_bar/search_bar_cubit.dart';

part 'log_page_state.dart';

class LogPageCubit extends Cubit<LogPageState> {
  final TextEditingController _editingController = TextEditingController();

  final List<LogItemCubit> _itemsCubits = [];

  late final SearchBarCubit _searchBarCubit;

  SearchBarCubit get searchBarCubit => _searchBarCubit;

  LogPageCubit() : super(LogPageInitial()) {
    _initialize();
  }

  void _initialize() {
    _itemsCubits.addAll([
      LogItemCubit('Наличные', 'Транспорт', 'поездка',
          DateTime.parse('2022-02-11 18:49:00'), -1000, 8000),
      LogItemCubit('Электронный кошелёк', 'Отдать долг', null,
          DateTime.parse('2022-02-11 17:55:00'), -999, 2500)
    ]);

    _searchBarCubit = SearchBarCubit(editingController: _editingController);

    emit(LogPageShow(_itemsCubits));
  }
}
