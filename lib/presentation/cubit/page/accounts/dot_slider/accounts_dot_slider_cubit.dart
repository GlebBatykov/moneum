import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moneum/presentation/cubit/page/accounts/dot_slider/dot/accounts_dot_cubit.dart';

part 'accounts_dot_slider_state.dart';

class AccountsDotSliderCubit extends Cubit<AccountsDotSliderState> {
  final double _width;

  final double _delimiter;

  List<AccountDotCubit> _dotsCubits = [];

  bool _isLock = false;

  AccountsDotSliderCubit(double width, double delimiter)
      : _width = width,
        _delimiter = delimiter,
        super(AccountsDotSliderInitial()) {
    _initialize();
  }

  void _initialize() {
    var middle = _width / 2 - 3;

    for (var i = 0, j = _delimiter; i < 3; i++, j += _delimiter) {
      _dotsCubits.add(AccountDotCubit(middle - j, isVisible: i < 2));
    }

    _dotsCubits = _dotsCubits.reversed.toList();

    _dotsCubits.add(AccountDotCubit(middle));

    for (var i = 0, j = _delimiter; i < 3; i++, j += _delimiter) {
      _dotsCubits.add(AccountDotCubit(middle + j, isVisible: i < 2));
    }

    emit(AccountsDotSliderShow(_width, _dotsCubits));

    _dotsCubits[3].select();
  }

  void left() {
    if (!_isLock) {
      _isLock = true;

      for (AccountDotCubit cubit in _dotsCubits) {
        cubit.changePosition(-_delimiter);
      }

      _dotsCubits[3].unselect();
      _dotsCubits[4].select();

      _dotsCubits.last.setVisible(true);

      var current = _dotsCubits[1];

      current.setOnEnd(() {
        _dotsCubits.first.setDuration(Duration.zero);

        _dotsCubits.first.setPosition(_dotsCubits.last.left + _delimiter);

        _dotsCubits.first.setDuration(const Duration(milliseconds: 300));

        var temp = _dotsCubits.first;

        for (var i = 1; i < _dotsCubits.length; i++) {
          _dotsCubits[i - 1] = _dotsCubits[i];
        }

        _dotsCubits[_dotsCubits.length - 1] = temp;

        current.setOnEnd(null);

        _isLock = false;
      });

      _dotsCubits[1].setVisible(false);
    }
  }

  void right() {
    if (!_isLock) {
      _isLock = true;

      for (AccountDotCubit cubit in _dotsCubits) {
        cubit.changePosition(_delimiter);
      }

      _dotsCubits[3].unselect();
      _dotsCubits[2].select();

      _dotsCubits.first.setVisible(true);

      var current = _dotsCubits[_dotsCubits.length - 2];

      current.setOnEnd(() {
        _dotsCubits.last.setDuration(Duration.zero);

        _dotsCubits.last.setPosition(_dotsCubits.first.left - _delimiter);

        _dotsCubits.last.setDuration(const Duration(milliseconds: 300));

        var temp = _dotsCubits.last;

        for (var i = _dotsCubits.length - 1; i > 0; i--) {
          _dotsCubits[i] = _dotsCubits[i - 1];
        }

        _dotsCubits[0] = temp;

        current.setOnEnd(null);

        _isLock = false;
      });

      _dotsCubits[_dotsCubits.length - 2].setVisible(false);
    }
  }
}
