import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_item_state.dart';

class LogItemCubit extends Cubit<LogItemState> {
  final String _title;

  final String _category;

  final String? _comment;

  final DateTime _date;

  final double _value;

  final double _remains;

  LogItemCubit(String title, String category, String? comment, DateTime date,
      double value, double remains)
      : _title = title,
        _category = category,
        _comment = comment,
        _date = date,
        _value = value,
        _remains = remains,
        super(LogItemInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(LogItemShow(_title, _category, _comment, _date, _value, _remains));
  }
}
