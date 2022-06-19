part of 'update_date_field_cubit.dart';

@immutable
abstract class UpdateDateFieldState {}

class UpdateDateFieldInitial extends UpdateDateFieldState {}

class UpdateDateFieldShow extends UpdateDateFieldState {
  final String fieldTitle;

  final String title;

  UpdateDateFieldShow(this.fieldTitle, this.title);
}
