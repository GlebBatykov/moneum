import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/page/transaction_update/field/repeat/repeat_pattern.dart';
import '../../../../model/page/transaction_update/field/repeat/without_repeat_pattern.dart';

part 'transaction_update_repeat_field_state.dart';

class TransactionUpdateRepeatFieldCubit
    extends Cubit<TransactionUpdateRepeatFieldState> {
  late bool _isRepeatEnabled;

  late RepeatPattern _pattern;

  RepeatPattern get pattern => _pattern;

  TransactionUpdateRepeatFieldCubit()
      : super(TransactionUpdateRepeatFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _isRepeatEnabled = false;

    _pattern = WithoutRepeatPattern();

    _show();
  }

  void setRepeatEnabled(bool value) {
    _isRepeatEnabled = value;

    _show();
  }

  void _show() {
    emit(TransactionUpdateRepeatFieldShow(
        _pattern, _isRepeatEnabled, _pattern.type.name, _onSave));
  }

  void _onSave(RepeatPattern pattern) {
    _pattern = pattern;

    _show();
  }
}
