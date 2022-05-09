import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../accounts/slider_menu/item/accounts_slider_menu_item_cubit.dart';
import '../dot_slider/accounts_dot_slider_cubit.dart';

part 'accounts_slider_menu_state.dart';

class AccountsSliderMenuCubit extends Cubit<AccountsSliderMenuState> {
  final AccountsDotSliderCubit _dotSliderCubit;

  final List<AccountsSliderMenuItemCubit> _itemsCubits = [];

  late int _selectedIndex;

  AccountsSliderMenuCubit(AccountsDotSliderCubit dotSliderCubit)
      : _dotSliderCubit = dotSliderCubit,
        super(AccountsSliderMenuInitial()) {
    _initialize();
  }

  void _initialize() {
    _itemsCubits.addAll(['Счет OLX', 'Счет на Avito', 'Наличные']
        .map((e) => AccountsSliderMenuItemCubit(e)));

    _itemsCubits[0].select();

    _selectedIndex = 0;

    emit(AccountsSliderMenuShow(_itemsCubits));
  }

  void selectItem(int index) {
    for (var i = 0; i < _itemsCubits.length; i++) {
      if (i == index) {
        _itemsCubits[i].select();
      } else {
        _itemsCubits[i].unselect();
      }
    }

    var difference = _selectedIndex - index;

    if ((difference).abs() > 1) {
      if (difference.isNegative) {
        _dotSliderCubit.left();
      } else {
        _dotSliderCubit.right();
      }
    } else {
      if (index < _selectedIndex) {
        _dotSliderCubit.left();
      } else {
        _dotSliderCubit.right();
      }
    }

    _selectedIndex = index;
  }
}
