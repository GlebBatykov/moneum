import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'accounts_dot_state.dart';

class AccountDotCubit extends Cubit<AccountDotState> {
  double _left;

  bool _isSelected = false;

  bool _isVisible = true;

  Duration _duration;

  void Function()? _onEnd;

  double get left => _left;

  AccountDotCubit(double left,
      {bool isVisible = true,
      Duration duration = const Duration(milliseconds: 300),
      void Function()? onEnd})
      : _left = left,
        _isVisible = isVisible,
        _onEnd = onEnd,
        _duration = duration,
        super(AccountDotUnselect(left, isVisible, onEnd, duration));

  void changePosition(double left) {
    _left += left;

    _update();
  }

  void setDuration(Duration value) {
    _duration = value;

    _update();
  }

  void setPosition(double value) {
    _left = value;

    _update();
  }

  void select() {
    if (!_isSelected) {
      emit(AccountDotSelect(_left, _isVisible, _onEnd, _duration));

      _isSelected = true;
    }
  }

  void unselect() {
    if (_isSelected) {
      emit(AccountDotUnselect(_left, _isVisible, _onEnd, _duration));

      _isSelected = false;
    }
  }

  void setVisible(bool value) {
    _isVisible = value;

    _update();
  }

  void setOnEnd(void Function()? value) {
    _onEnd = value;

    _update();
  }

  void _update() {
    if (_isSelected) {
      emit(AccountDotSelect(_left, _isVisible, _onEnd, _duration));
    } else {
      emit(AccountDotUnselect(_left, _isVisible, _onEnd, _duration));
    }
  }
}
