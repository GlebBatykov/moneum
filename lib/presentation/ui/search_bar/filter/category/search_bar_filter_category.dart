import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneum/presentation/cubit/search_bar/filter/category/search_bar_filter_category_cubit.dart';

class SearchBarFilterCategory extends StatelessWidget {
  const SearchBarFilterCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchBarFilterCategoryCubit =
        context.watch<SearchBarFilterCategoryCubit>();

    return BlocBuilder<SearchBarFilterCategoryCubit,
            SearchBarFilterCategoryState>(
        bloc: searchBarFilterCategoryCubit,
        builder: (context, state) {
          if (state is SearchBarFilterCategoryShow) {
            return InkWell(
              onTap: () {
                if (searchBarFilterCategoryCubit.isSelected) {
                  searchBarFilterCategoryCubit.unselect();
                } else {
                  searchBarFilterCategoryCubit.select();
                }
              },
              child: Container(
                height: state.height,
                width: state.width,
                margin: state.margin,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                        state is SearchBarFilterCategoryUnselect ? 0.15 : 1),
                    borderRadius: BorderRadius.circular(13.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.name,
                        style: TextStyle(
                            color: state is SearchBarFilterCategoryUnselect
                                ? Colors.white
                                : Colors.black)),
                    state is SearchBarFilterCategoryUnselect
                        ? SvgPicture.asset(
                            'assets/images/icons/angle-small-down.svg',
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            'assets/images/icons/exit.svg',
                            color: Colors.black,
                          )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
