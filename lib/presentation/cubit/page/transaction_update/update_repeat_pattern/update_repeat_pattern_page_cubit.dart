import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/page/transaction_update/field/repeat/every_day_repeat_pattern.dart';
import '../../../../model/page/transaction_update/field/repeat/every_month_repeat_pattern.dart';
import '../../../../model/page/transaction_update/field/repeat/every_week_repeat_pattern.dart';
import '../../../../model/page/transaction_update/field/repeat/repeat_pattern.dart';
import '../../../../model/page/transaction_update/field/repeat/repeat_type.dart';
import '../../../../model/page/transaction_update/field/repeat/without_repeat_pattern.dart';
import 'field/repeat_pattern_update_type_field_cubit.dart';
import 'field/type_properties/repeat_pattern_update_type_properties_cubit.dart';

part 'update_repeat_pattern_page_state.dart';

class UpdateRepeatPatternPageCubit extends Cubit<UpdateRepeatPatternPageState> {
  final void Function(RepeatPattern) _onSave;

  late final RepeatPatternUpdateTypeFieldCubit _typeFieldCubit;

  late final RepeatPatternUpdateTypePropertiesCubit _typePropertiesCubit;

  UpdateRepeatPatternPageCubit(
      void Function(RepeatPattern) onSave, RepeatPattern pattern)
      : _onSave = onSave,
        super(UpdateRepeatPatternPageInitial()) {
    _initialize(pattern);
  }

  void _initialize(RepeatPattern pattern) {
    var type = pattern.type;

    _typeFieldCubit = RepeatPatternUpdateTypeFieldCubit(type);

    _typePropertiesCubit = RepeatPatternUpdateTypePropertiesCubit(pattern);

    _typeFieldCubit.typeChanges.listen(_handleTypeChange);

    _show();
  }

  void _handleTypeChange(RepeatType type) {
    _typePropertiesCubit.changeType(type);

    _show();
  }

  void save() {
    late RepeatPattern pattern;

    switch (_typeFieldCubit.type) {
      case RepeatType.everyDay:
        var properties = _typePropertiesCubit.getEveryDayPatternProperties();
        pattern = EveryDayRepeatPattern(properties.dayFrequency,
            properties.startDate, properties.periodPattern);

        break;
      case RepeatType.everyWeek:
        var properties = _typePropertiesCubit.getEveryWeekProperties();
        pattern = EveryWeekRepeatPattern(properties.weekFrequency,
            properties.startDate, properties.periodPattern);

        break;
      case RepeatType.everyMonth:
        var properties = _typePropertiesCubit.getEveryMonthProperties();
        pattern = EveryMonthRepeatPattern(
            properties.dayFrequency,
            properties.monthFrequency,
            properties.startDate,
            properties.periodPattern);

        break;
      case RepeatType.withoutRepeat:
        pattern = WithoutRepeatPattern();
        break;
    }

    _onSave(pattern);

    Poseidon.instance.pop();
  }

  void _show() {
    emit(UpdateRepeatPatternPageShow(_typeFieldCubit, _typePropertiesCubit));
  }
}
