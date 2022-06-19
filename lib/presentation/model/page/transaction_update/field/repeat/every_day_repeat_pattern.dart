import 'period/pattern/period_pattern.dart';
import 'repeat_pattern.dart';
import 'repeat_type.dart';

class EveryDayRepeatPattern extends RepeatPattern {
  final int dayFrequency;

  final DateTime startDate;

  final PeriodPattern periodPattern;

  EveryDayRepeatPattern(this.dayFrequency, this.startDate, this.periodPattern)
      : super(RepeatType.everyDay);
}
