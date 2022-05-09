part of 'search_bar_filter_cubit.dart';

@immutable
abstract class SearchBarFilterState {}

class SearchBarFilterInitial extends SearchBarFilterState {}

class SearchBarFilterShow extends SearchBarFilterState {
  final List<SearchBarFilterCategoryCubit> categoryCubits;

  SearchBarFilterShow(this.categoryCubits);
}
