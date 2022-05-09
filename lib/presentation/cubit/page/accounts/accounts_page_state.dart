part of 'accounts_page_cubit.dart';

@immutable
abstract class AccountsPageState {}

class AccountsPageInitial extends AccountsPageState {}

class AccountsPageEmpty extends AccountsPageState {}

class AccountsPageNotEmpty extends AccountsPageState {
  final AccountsDotSliderCubit dotSliderCubit;

  final AccountsSliderMenuCubit sliderMenuCubit;

  AccountsPageNotEmpty(this.dotSliderCubit, this.sliderMenuCubit);
}
