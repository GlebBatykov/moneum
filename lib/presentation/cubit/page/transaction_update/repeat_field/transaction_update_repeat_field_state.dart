part of 'transaction_update_repeat_field_cubit.dart';

@immutable
abstract class TransactionUpdateRepeatFieldState {}

class TransactionUpdateRepeatFieldInitial
    extends TransactionUpdateRepeatFieldState {}

class TransactionUpdateRepeatFieldShow
    extends TransactionUpdateRepeatFieldState {
  final RepeatPattern pattern;

  final bool isRepeatEnabled;

  final String title;

  final void Function(RepeatPattern) onSave;

  TransactionUpdateRepeatFieldShow(
      this.pattern, this.isRepeatEnabled, this.title, this.onSave);
}
