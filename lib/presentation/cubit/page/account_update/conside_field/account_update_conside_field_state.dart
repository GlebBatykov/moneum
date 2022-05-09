part of 'account_update_conside_field_cubit.dart';

@immutable
abstract class AccountUpdateConsideFieldState {
  final void Function(bool)? onToggle;

  const AccountUpdateConsideFieldState(this.onToggle);
}

class AccountUpdateConsideFieldActive extends AccountUpdateConsideFieldState {
  const AccountUpdateConsideFieldActive(void Function(bool)? onToggle)
      : super(onToggle);
}

class AccountUpdateConsideFieldInactive extends AccountUpdateConsideFieldState {
  const AccountUpdateConsideFieldInactive(void Function(bool)? onToggle)
      : super(onToggle);
}
