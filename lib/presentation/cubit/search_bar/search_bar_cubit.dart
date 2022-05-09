import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'filter/search_bar_filter_cubit.dart';

part 'search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  final TextEditingController _editingController;

  late final SearchBarFilterCubit _searchBarFilterCubit;

  late bool _isTextFieldEmpty;

  bool _isFilterVisible = false;

  SearchBarCubit({TextEditingController? editingController})
      : _editingController = editingController ?? TextEditingController(),
        super(SearchBarInitial()) {
    _initialize();
  }

  void _initialize() {
    _searchBarFilterCubit = SearchBarFilterCubit();

    _isTextFieldEmpty = _editingController.text.isEmpty;

    _editingController.addListener(() {
      if (_editingController.text.isEmpty && !_isTextFieldEmpty) {
        _isTextFieldEmpty = true;
        _show();
      } else if (_editingController.text.isNotEmpty && _isTextFieldEmpty) {
        _isTextFieldEmpty = false;
        _show();
      }
    });

    _show();
  }

  void changeFilterVisible() {
    _isFilterVisible = !_isFilterVisible;

    _show();
  }

  void _show() {
    emit(SearchBarShow(_editingController, _searchBarFilterCubit,
        _isTextFieldEmpty, _isFilterVisible));
  }
}
