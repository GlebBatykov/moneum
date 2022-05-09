part of 'log_item_cubit.dart';

@immutable
abstract class LogItemState {}

class LogItemInitial extends LogItemState {}

class LogItemShow extends LogItemState {
  final String title;

  final String category;

  final String? comment;

  final DateTime date;

  final double value;

  final double remains;

  LogItemShow(this.title, this.category, this.comment, this.date, this.value,
      this.remains);
}
