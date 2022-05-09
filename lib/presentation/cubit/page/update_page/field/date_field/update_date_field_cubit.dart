import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'update_date_field_state.dart';

class UpdateDateFieldCubit extends Cubit<UpdateDateFieldState> {
  DateTime _dateTime;

  late String _title;

  UpdateDateFieldCubit({DateTime? dateTime})
      : _dateTime = dateTime ?? DateTime.now(),
        super(UpdateDateFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _title = _buildTitle();

    _show();
  }

  void change(DateTime dateTime) {
    _dateTime = dateTime;
    _title = _buildTitle();

    _show();
  }

  String _buildTitle() {
    return _dateTime.day.toString() +
        ' ' +
        DateFormat.MMM().format(_dateTime) +
        ' ' +
        _dateTime.year.toString() +
        ' | ' +
        _dateTime.hour.toString() +
        ':' +
        _dateTime.minute.toString();
  }

  void _show() {
    emit(UpdateDateFieldShow(_title));
  }
}
