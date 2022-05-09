part of 'accounts_dot_cubit.dart';

@immutable
abstract class AccountDotState {
  final double left;

  final bool isVisible;

  final void Function()? onEnd;

  final Duration duration;

  const AccountDotState(this.left, this.isVisible, this.onEnd, this.duration);
}

class AccountDotSelect extends AccountDotState {
  const AccountDotSelect(
      double left, bool isVisible, void Function()? onEnd, Duration duration)
      : super(left, isVisible, onEnd, duration);
}

class AccountDotUnselect extends AccountDotState {
  const AccountDotUnselect(
      double left, bool isVisible, void Function()? onEnd, Duration duration)
      : super(left, isVisible, onEnd, duration);
}
