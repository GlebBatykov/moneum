import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moneum/presentation/cubit/search_bar/search_bar_cubit.dart';
import 'package:moneum/presentation/ui/material_icon.dart';
import 'package:moneum/presentation/ui/search_bar/filter/search_bar_filter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchBarCubit = context.watch<SearchBarCubit>();

    return BlocBuilder<SearchBarCubit, SearchBarState>(
        bloc: searchBarCubit,
        builder: (context, state) {
          if (state is SearchBarShow) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(13.5)),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15, right: 11),
                          child: SvgPicture.asset(
                            'assets/images/icons/search.svg',
                            color: state.isTextFieldEmpty
                                ? HexColor('#A4A4A4')
                                : HexColor('#3D3E41'),
                          )),
                      SizedBox(
                          width: 300,
                          child: TextField(
                            controller: state.editingController,
                            style: TextStyle(
                                color: HexColor('#3D3E41'),
                                fontSize: 16,
                                fontFamily: 'Arial'),
                            decoration: InputDecoration(
                              isDense: false,
                              border: InputBorder.none,
                              hintText: 'Поиск',
                              hintStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  color: HexColor('#A4A4A4'),
                                  fontSize: 16),
                            ),
                          )),
                      MaterialIcon(
                          assetName: 'assets/images/icons/settings-sliders.svg',
                          width: 15,
                          heigth: 15,
                          color: state.isFilterVisible
                              ? HexColor('#3D3E41')
                              : HexColor('#A4A4A4'),
                          onPressed: () {
                            searchBarCubit.changeFilterVisible();
                          })
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: BlocProvider.value(
                            value: state.searchBarFilterCubit,
                            child: const SearchBarFilter()),
                        crossFadeState: state.isFilterVisible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300)))
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
