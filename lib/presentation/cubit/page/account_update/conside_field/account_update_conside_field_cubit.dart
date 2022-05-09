import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'account_update_conside_field_state.dart';

class AccountUpdateConsideFieldCubit
    extends Cubit<AccountUpdateConsideFieldState> {
  final void Function(bool)? _onToggle;

  AccountUpdateConsideFieldCubit(
      {bool isActive = false, void Function(bool)? onToggle})
      : _onToggle = onToggle,
        super(isActive
            ? AccountUpdateConsideFieldActive(onToggle)
            : AccountUpdateConsideFieldInactive(onToggle));

  void changeState(bool value) {
    if (value) {
      emit(AccountUpdateConsideFieldActive(_onToggle));
    } else {
      emit(AccountUpdateConsideFieldInactive(_onToggle));
    }
  }
}
