import 'pattern/period_pattern.dart';

import 'repeat_period_type.dart';

class CountPeriodPattern extends PeriodPattern {
  final int count;

  CountPeriodPattern(this.count) : super(RepeatPeriodType.count);
}
