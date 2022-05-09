import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../accounts/dot_slider/accounts_dot_slider_cubit.dart';
import '../accounts/slider_menu/accounts_slider_menu_cubit.dart';

part 'accounts_page_state.dart';

class AccountsPageCubit extends Cubit<AccountsPageState> {
  late final AccountsDotSliderCubit _dotSliderCubit;

  late final AccountsSliderMenuCubit _sliderMenuCubit;

  AccountsPageCubit() : super(AccountsPageInitial()) {
    _initialize();
  }

  void _initialize() async {
    _dotSliderCubit = AccountsDotSliderCubit(72, 11);

    _sliderMenuCubit = AccountsSliderMenuCubit(_dotSliderCubit);

    emit(AccountsPageNotEmpty(_dotSliderCubit, _sliderMenuCubit));
  }
}
