class RepeatPeriodType {
  final String name;

  static const RepeatPeriodType infinity = RepeatPeriodType._('Бесконечно');

  static const RepeatPeriodType count = RepeatPeriodType._('N раз');

  static const RepeatPeriodType date = RepeatPeriodType._('Остановить на дату');

  static const List<RepeatPeriodType> values = [infinity, count, date];

  const RepeatPeriodType._(this.name);

  @override
  String toString() {
    return name;
  }
}
