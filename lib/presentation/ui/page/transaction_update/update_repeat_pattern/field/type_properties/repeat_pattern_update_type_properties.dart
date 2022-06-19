import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/ui/page/update/field/update_date_field.dart';

import '../../../../../../cubit/page/transaction_update/update_repeat_pattern/field/type_properties/every_day/every_day_repeat_pattern_update_type_properties_cubit.dart';
import '../../../../../../cubit/page/transaction_update/update_repeat_pattern/field/type_properties/every_month/every_week_repeat_pattern_update_type_properties_cubit.dart';
import '../../../../../../cubit/page/transaction_update/update_repeat_pattern/field/type_properties/every_week/every_month_repeat_pattern_update_type_properties_cubit.dart';
import '../../../../../../cubit/page/transaction_update/update_repeat_pattern/field/type_properties/repeat_pattern_update_type_properties_cubit.dart';
import '../../../../../content_divider.dart';
import '../../../../update/field/update_value_field.dart';
import 'field/repeat_pattern_update_type_properties_period_field.dart';

class RepeatPatternUpdateTypeProperties extends StatelessWidget {
  const RepeatPatternUpdateTypeProperties({Key? key}) : super(key: key);

  Widget _buildEveryDayProperties(
      RepeatPatternUpdateTypePropertiesEveryDay state) {
    return BlocBuilder<EveryDayRepeatPatternUpdateTypePropertiesCubit,
            EveryDayRepeatPatternUpdateTypePropertiesState>(
        bloc: state.everyDayPropertiesCubit,
        builder: (context, state) {
          if (state is EveryDayRepeatPatternUpdateTypePropertiesShow) {
            return Column(children: [
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 10)),
              UpdateValueField(
                  title: 'Каждый X день',
                  hint: 'Введите периодичность',
                  textAlign: TextAlign.right,
                  editingController: state.dayFrequencyEditingController),
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 10)),
              BlocProvider.value(
                  value: state.dateFieldCubit, child: const UpdateDateField()),
              const ContentDivider(
                  margin: EdgeInsets.only(top: 10, bottom: 10)),
              BlocProvider.value(
                  value: state.periodFieldCubit,
                  child: const RepeatPatternUpdateTypePropertiesPeriodField())
            ]);
          } else {
            return Container();
          }
        });
  }

  Widget _buildEveryWeekProperties(
      RepeatPatternUpdateTypePropertiesEveryWeek state) {
    return BlocBuilder<EveryWeekRepeatPatternUpdateTypePropertiesCubit,
            EveryWeekRepeatPatternUpdateTypePropertiesState>(
        bloc: state.everyWeekPropertiesCubit,
        builder: (context, state) {
          if (state is EveryWeekRepeatPatternUpdateTypePropertiesShow) {
            return Column(
              children: [
                const ContentDivider(
                    margin: EdgeInsets.only(top: 10, bottom: 10)),
                UpdateValueField(
                    title: 'Каждыю X неделю',
                    hint: 'Введите периодичность',
                    textAlign: TextAlign.right,
                    editingController: state.weekFrequencyEditingController),
              ],
            );
          } else {
            return Container();
          }
        });
  }

  Widget _buildEveryMonthProperties(
      RepeatPatternUpdateTypePropertiesEveryMonth state) {
    return BlocBuilder<EveryMonthRepeatPatternUpdateTypePropertiesCubit,
            EveryMonthRepeatPatternUpdateTypePropertiesState>(
        bloc: state.everyMonthPropertiesCubit,
        builder: (context, state) {
          if (state is EveryMonthRepeatPatternUpdateTypePropertiesShow) {
            return Column();
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepeatPatternUpdateTypePropertiesCubit,
        RepeatPatternUpdateTypePropertiesState>(builder: (context, state) {
      if (state is RepeatPatternUpdateTypePropertiesEveryDay) {
        return _buildEveryDayProperties(state);
      } else if (state is RepeatPatternUpdateTypePropertiesEveryWeek) {
        return _buildEveryWeekProperties(state);
      } else if (state is RepeatPatternUpdateTypePropertiesEveryMonth) {
        return _buildEveryMonthProperties(state);
      } else {
        return Container();
      }
    });
  }
}
