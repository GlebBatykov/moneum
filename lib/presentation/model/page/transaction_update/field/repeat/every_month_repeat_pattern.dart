import '../../../../../cubit/page/transaction_update/update_repeat_pattern/type_field/repeat_pattern_update_type_field_cubit.dart';
import 'period/period.dart';
import 'repeat_pattern.dart';

class EveryMonthRepeatPattern extends RepeatPattern {
  final int dayFrequency;

  final int monthFrequency;

  final DateTime startDate;

  final Period period;

  EveryMonthRepeatPattern(
      this.dayFrequency, this.monthFrequency, this.startDate, this.period)
      : super(RepeatType.everyMonth);
}
