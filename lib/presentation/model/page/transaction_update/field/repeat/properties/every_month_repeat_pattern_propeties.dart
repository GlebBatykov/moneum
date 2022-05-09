import '../period/period.dart';

class EveryMonthRepeatPatternProperties {
  final int dayFrequency;

  final int monthFrequency;

  final DateTime startDate;

  final Period period;

  EveryMonthRepeatPatternProperties(
      this.dayFrequency, this.monthFrequency, this.startDate, this.period);
}
