import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/cubit/search_bar/filter/search_bar_filter_cubit.dart';

import 'category/search_bar_filter_category.dart';

class SearchBarFilter extends StatelessWidget {
  const SearchBarFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarFilterCubit, SearchBarFilterState>(
        builder: (context, state) {
      if (state is SearchBarFilterShow) {
        return SizedBox(
          height: 40,
          child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();

                return true;
              },
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categoryCubits.length,
                  itemBuilder: ((context, index) => BlocProvider.value(
                      value: state.categoryCubits[index],
                      child: const SearchBarFilterCategory())))),
        );
      } else {
        return Container();
      }
    });
  }
}
