import '../period/pattern/period_pattern.dart';

class EveryDayRepeatPatternProperties {
  final int dayFrequency;

  final DateTime startDate;

  final PeriodPattern periodPattern;

  EveryDayRepeatPatternProperties(
      this.dayFrequency, this.startDate, this.periodPattern);
}
