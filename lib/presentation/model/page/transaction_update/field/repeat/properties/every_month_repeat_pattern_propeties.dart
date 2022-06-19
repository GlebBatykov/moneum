import '../period/pattern/period_pattern.dart';

class EveryMonthRepeatPatternProperties {
  final int dayFrequency;

  final int monthFrequency;

  final DateTime startDate;

  final PeriodPattern periodPattern;

  EveryMonthRepeatPatternProperties(this.dayFrequency, this.monthFrequency,
      this.startDate, this.periodPattern);
}
