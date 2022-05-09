part of 'accounts_dot_slider_cubit.dart';

@immutable
abstract class AccountsDotSliderState {}

class AccountsDotSliderInitial extends AccountsDotSliderState {}

class AccountsDotSliderShow extends AccountsDotSliderState {
  final double width;

  final List<AccountDotCubit> dotsCubits;

  AccountsDotSliderShow(this.width, this.dotsCubits);
}
