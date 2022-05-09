part of 'search_bar_filter_category_cubit.dart';

@immutable
abstract class SearchBarFilterCategoryState {}

class SearchBarFilterCategoryInitial extends SearchBarFilterCategoryState {}

abstract class SearchBarFilterCategoryShow
    extends SearchBarFilterCategoryState {
  final String name;

  final double width;

  final double height;

  final EdgeInsets margin;

  SearchBarFilterCategoryShow(this.name, this.width, this.height, this.margin);
}

class SearchBarFilterCategoryUnselect extends SearchBarFilterCategoryShow {
  SearchBarFilterCategoryUnselect(
      String name, double width, double heigth, EdgeInsets margin)
      : super(name, width, heigth, margin);
}

class SearchBarFilterCategorySelect extends SearchBarFilterCategoryShow {
  SearchBarFilterCategorySelect(
      String name, double width, double heigth, EdgeInsets margin)
      : super(name, width, heigth, margin);
}
