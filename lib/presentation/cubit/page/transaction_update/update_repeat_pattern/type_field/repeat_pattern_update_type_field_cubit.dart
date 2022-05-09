import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../model/page/transaction_update/update_repeat_pattern/update_repeat_pattern_field_select_dialog_item_data.dart';
import '../../../../dialog/select_dialog_list/select_dialog_list_cubit.dart';

part 'repeat_pattern_update_type_field_state.dart';

class RepeatType {
  final String name;

  static const RepeatType withoutRepeat = RepeatType._('Без повторения');

  static const RepeatType everyDay = RepeatType._('Ежедневно');

  static const RepeatType everyWeek = RepeatType._('Каждую неделю');

  static const RepeatType everyMonth = RepeatType._('Ежемесячно');

  const RepeatType._(this.name);

  @override
  String toString() {
    return name;
  }
}

class RepeatPatternUpdateTypeFieldCubit
    extends Cubit<RepeatPatternUpdateTypeFieldState> {
  final StreamController<RepeatType> _typeChangeController =
      StreamController.broadcast();

  late final SelectDialogListCubit<UpdateRepeatPatternFieldSelectDialogItemData>
      _selectDialogCubit;

  late String _title;

  late RepeatType _type;

  RepeatType get type => _type;

  Stream<RepeatType> get typeChanges => _typeChangeController.stream;

  RepeatPatternUpdateTypeFieldCubit(RepeatType type)
      : _type = type,
        super(RepeatPatternUpdateTypeFieldInitial()) {
    _initialize();
  }

  void _initialize() {
    _selectDialogCubit =
        SelectDialogListCubit<UpdateRepeatPatternFieldSelectDialogItemData>(
            'Выберите периодичность', [
      UpdateRepeatPatternFieldSelectDialogItemData(
          'Без повторений', RepeatType.withoutRepeat),
      UpdateRepeatPatternFieldSelectDialogItemData(
          'Ежедневно', RepeatType.everyDay),
      UpdateRepeatPatternFieldSelectDialogItemData(
          'Каждую неделю', RepeatType.everyWeek),
      UpdateRepeatPatternFieldSelectDialogItemData(
          'Ежемесячно', RepeatType.everyMonth),
    ], onSelect: (value, index) {
      _title = value.title;
      _type = value.type;

      _typeChangeController.sink.add(_type);

      _show();

      Poseidon.instance.pop();
    });

    _title = _selectDialogCubit.selectedItem.title;
    _type = _selectDialogCubit.selectedItem.type;

    _show();
  }

  void _show() {
    emit(RepeatPatternUpdateTypeFieldShow(_title, _selectDialogCubit));
  }

  @override
  Future<void> close() async {
    await _typeChangeController.close();

    return super.close();
  }
}
