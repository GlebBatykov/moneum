class RepeatType {
  final String name;

  static const RepeatType withoutRepeat = RepeatType._('Без повторения');

  static const RepeatType everyDay = RepeatType._('Ежедневно');

  static const RepeatType everyWeek = RepeatType._('Каждую неделю');

  static const RepeatType everyMonth = RepeatType._('Ежемесячно');

  static final List<RepeatType> values = [
    withoutRepeat,
    everyDay,
    everyWeek,
    everyMonth
  ];

  const RepeatType._(this.name);

  @override
  String toString() {
    return name;
  }
}
