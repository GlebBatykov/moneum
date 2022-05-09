extension DoubleConvertToString on double {
  String toCustomString() {
    return toStringAsFixed(2).replaceFirst('.', ',');
  }
}
