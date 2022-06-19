import 'period/pattern/period_pattern.dart';
import 'repeat_pattern.dart';
import 'repeat_type.dart';

class EveryMonthRepeatPattern extends RepeatPattern {
  final int dayFrequency;

  final int monthFrequency;

  final DateTime startDate;

  final PeriodPattern periodPattern;

  EveryMonthRepeatPattern(this.dayFrequency, this.monthFrequency,
      this.startDate, this.periodPattern)
      : super(RepeatType.everyMonth);
}
