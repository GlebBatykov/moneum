import '../../../../cubit/search_bar/filter/category/search_bar_filter_operation_category_cubit.dart';
import '../../../dialog/select_dialog_list_item_data.dart';

class SearchBarFilterOperationSelectDialogItemData
    extends SelectDialogListItemData {
  final OperationType type;

  SearchBarFilterOperationSelectDialogItemData(String title, this.type)
      : super(title);
}
