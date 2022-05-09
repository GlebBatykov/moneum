import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubit/page/transaction_update/update_repeat_pattern/type_field/type_properties/repeat_pattern_update_type_properties_cubit.dart';

class RepeatPatternUpdateTypeProperties extends StatelessWidget {
  const RepeatPatternUpdateTypeProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepeatPatternUpdateTypePropertiesCubit,
        RepeatPatternUpdateTypePropertiesState>(builder: (context, state) {
      if (state is RepeatPatternUpdateTypePropertiesEveryDay) {
        return Container();
      } else if (state is RepeatPatternUpdateTypePropertiesEveryWeek) {
        return Container();
      } else if (state is RepeatPatternUpdateTypePropertiesEveryMonth) {
        return Container();
      } else {
        return Container();
      }
    });
  }
}
