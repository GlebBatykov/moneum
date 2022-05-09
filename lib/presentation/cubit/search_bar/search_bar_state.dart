part of 'search_bar_cubit.dart';

@immutable
abstract class SearchBarState {}

class SearchBarInitial extends SearchBarState {}

class SearchBarShow extends SearchBarState {
  final TextEditingController editingController;

  final SearchBarFilterCubit searchBarFilterCubit;

  final bool isTextFieldEmpty;

  final bool isFilterVisible;

  SearchBarShow(this.editingController, this.searchBarFilterCubit,
      this.isTextFieldEmpty, this.isFilterVisible);
}
