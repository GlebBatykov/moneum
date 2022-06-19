import 'period/pattern/period_pattern.dart';
import 'repeat_pattern.dart';
import 'repeat_type.dart';

class EveryWeekRepeatPattern extends RepeatPattern {
  final int weekFrequency;

  final DateTime startDate;

  final PeriodPattern periodPattern;

  EveryWeekRepeatPattern(this.weekFrequency, this.startDate, this.periodPattern)
      : super(RepeatType.everyWeek);
}
