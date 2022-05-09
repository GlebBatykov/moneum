import '../../../../../cubit/page/transaction_update/update_repeat_pattern/type_field/repeat_pattern_update_type_field_cubit.dart';
import 'period/period.dart';
import 'repeat_pattern.dart';

class EveryDayRepeatPattern extends RepeatPattern {
  final int dayFrequency;

  final DateTime startDate;

  final Period period;

  EveryDayRepeatPattern(this.dayFrequency, this.startDate, this.period)
      : super(RepeatType.everyDay);
}
