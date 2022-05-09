import 'package:moneum/presentation/model/dialog/select_dialog_list_item_data.dart';

import '../../../../cubit/search_bar/filter/category/search_bar_filter_period_category_cubit.dart';

class SearchBarFilterPeriodSelectDialogItemData
    extends SelectDialogListItemData {
  final PeriodType type;

  SearchBarFilterPeriodSelectDialogItemData(String title, this.type)
      : super(title);
}
