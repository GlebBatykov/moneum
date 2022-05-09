import '../../../../cubit/page/transaction_update/update_repeat_pattern/type_field/repeat_pattern_update_type_field_cubit.dart';
import '../../../dialog/select_dialog_list_item_data.dart';

class UpdateRepeatPatternFieldSelectDialogItemData
    extends SelectDialogListItemData {
  final RepeatType type;

  UpdateRepeatPatternFieldSelectDialogItemData(String title, this.type)
      : super(title);
}
