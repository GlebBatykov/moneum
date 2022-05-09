part of 'type_operation_toggle_button_cubit.dart';

@immutable
abstract class TypeOperationToggleButtonState {}

class TypeOperationToggleButtonInitial extends TypeOperationToggleButtonState {}

class TypeOperationToggleButtonShow extends TypeOperationToggleButtonState {
  final OperationType type;

  final void Function() onEnd;

  TypeOperationToggleButtonShow(this.type, this.onEnd);
}
