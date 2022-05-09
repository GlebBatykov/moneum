import 'package:moneum/presentation/model/dialog/select_dialog_list_item_data.dart';

import '../../../../cubit/search_bar/filter/category/search_bar_filter_score_category_cubit.dart';

class SearchBarFilterScoreSelectDialogItemData
    extends SelectDialogListItemData {
  final ScoreType type;

  SearchBarFilterScoreSelectDialogItemData(String title, this.type)
      : super(title);
}
