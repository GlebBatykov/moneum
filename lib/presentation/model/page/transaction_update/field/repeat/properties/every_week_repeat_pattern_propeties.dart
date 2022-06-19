import '../period/pattern/period_pattern.dart';

class EveryWeekRepeatPatternProperties {
  final int weekFrequency;

  final DateTime startDate;

  final PeriodPattern periodPattern;

  EveryWeekRepeatPatternProperties(
      this.weekFrequency, this.startDate, this.periodPattern);
}
