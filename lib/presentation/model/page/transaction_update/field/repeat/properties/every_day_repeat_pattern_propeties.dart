import '../period/period.dart';

class EveryDayRepeatPatternProperties {
  final int dayFrequency;

  final DateTime startDate;

  final Period period;

  EveryDayRepeatPatternProperties(
      this.dayFrequency, this.startDate, this.period);
}
