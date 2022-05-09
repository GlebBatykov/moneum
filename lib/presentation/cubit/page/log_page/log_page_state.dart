part of 'log_page_cubit.dart';

@immutable
abstract class LogPageState {}

class LogPageInitial extends LogPageState {}

class LogPageShow extends LogPageState {
  final List<LogItemCubit> itemsCubits;

  LogPageShow(this.itemsCubits);
}
