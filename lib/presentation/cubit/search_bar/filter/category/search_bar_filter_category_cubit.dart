import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_bar_filter_category_state.dart';

class SearchBarFilterCategoryCubit extends Cubit<SearchBarFilterCategoryState> {
  final String _name;

  final double _width;

  final double _height;

  final EdgeInsets _margin;

  bool _isSelected = false;

  bool get isSelected => _isSelected;

  SearchBarFilterCategoryCubit(
      String name, double width, double heigth, EdgeInsets margin)
      : _name = name,
        _width = width,
        _height = heigth,
        _margin = margin,
        super(SearchBarFilterCategoryInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(SearchBarFilterCategoryUnselect(_name, _width, _height, _margin));
  }

  void select() {
    if (!_isSelected) {
      emit(SearchBarFilterCategorySelect(_name, _width, _height, _margin));

      _isSelected = true;
    }
  }

  void unselect() {
    if (_isSelected) {
      emit(SearchBarFilterCategoryUnselect(_name, _width, _height, _margin));

      _isSelected = false;
    }
  }
}
