import 'package:poseidon/poseidon.dart';

import '../model/page/transaction_update/field/repeat/repeat_pattern.dart';

class UpdateRepeatPatternArguments extends PoseidonArguments {
  final RepeatPattern pattern;

  final void Function(RepeatPattern) onSave;

  UpdateRepeatPatternArguments(this.pattern, this.onSave);
}
