import '../period/period.dart';

class EveryWeekRepeatPatternProperties {
  final int weekFrequency;

  final DateTime startDate;

  final Period period;

  EveryWeekRepeatPatternProperties(
      this.weekFrequency, this.startDate, this.period);
}
