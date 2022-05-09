import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneum/presentation/cubit/page/accounts/slider_menu/item/accounts_slider_menu_item_cubit.dart';
import 'package:moneum/presentation/ui/page/accounts/slider_menu/item/accounts_slider_menu_item_setting.dart';

class AccountsSliderMenuItem extends StatelessWidget {
  const AccountsSliderMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsSliderMenuItemCubit,
        AccountsSliderMenuItemState>(builder: ((context, state) {
      return Center(
          child: SizedBox(
        height: AccountsSliderMenuItemSetting.height,
        child: Text(state.title,
            style: TextStyle(
                fontFamily: 'Arial',
                color: Colors.white,
                fontSize: state is AccountsSliderMenuItemUnselected ? 14 : 18,
                fontWeight: state is AccountsSliderMenuItemUnselected
                    ? FontWeight.normal
                    : FontWeight.bold)),
      ));
    }));
  }
}
