import '../../../../../cubit/page/transaction_update/update_repeat_pattern/type_field/repeat_pattern_update_type_field_cubit.dart';
import 'period/period.dart';
import 'repeat_pattern.dart';

class EveryWeekRepeatPattern extends RepeatPattern {
  final int weekFrequency;

  final DateTime startDate;

  final Period period;

  EveryWeekRepeatPattern(this.weekFrequency, this.startDate, this.period)
      : super(RepeatType.everyWeek);
}
