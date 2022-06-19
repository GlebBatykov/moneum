import '../../../dialog/select_dialog_list_item_data.dart';
import '../field/repeat/repeat_type.dart';

class UpdateRepeatPatternFieldSelectDialogItemData
    extends SelectDialogListItemData {
  final RepeatType type;

  UpdateRepeatPatternFieldSelectDialogItemData(super.title, this.type);
}
