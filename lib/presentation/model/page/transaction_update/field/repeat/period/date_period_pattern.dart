import 'pattern/period_pattern.dart';
import 'repeat_period_type.dart';

class DatePeriodPattern extends PeriodPattern {
  final DateTime endDate;

  DatePeriodPattern(this.endDate) : super(RepeatPeriodType.date);
}
