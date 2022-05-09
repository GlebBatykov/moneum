import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../search_bar/filter/category/search_bar_filter_operation_category_cubit.dart';

part 'type_operation_toggle_button_state.dart';

class TypeOperationToggleButtonCubit
    extends Cubit<TypeOperationToggleButtonState> {
  OperationType _type;

  bool _isAnimationRun = false;

  OperationType get type => _type;

  TypeOperationToggleButtonCubit({OperationType? type})
      : _type = type ?? OperationType.income,
        super(TypeOperationToggleButtonInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(TypeOperationToggleButtonShow(_type, _onEnd));
  }

  void change() {
    if (!_isAnimationRun) {
      _isAnimationRun = true;

      if (_type == OperationType.income) {
        _type = OperationType.consumption;
      } else {
        _type = OperationType.income;
      }

      emit(TypeOperationToggleButtonShow(type, _onEnd));
    }
  }

  void _onEnd() {
    _isAnimationRun = false;
  }
}
