import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moneum/domain/model/account.dart';
import 'package:moneum/presentation/cubit/page/account_update/body/account_update_page_body_cubit.dart';

part 'account_update_page_state.dart';

class AccountUpdatePageCubit extends Cubit<AccountUpdatePageState> {
  late final String _title;

  late final AccountUpdatePageBodyCubit _bodyCubit;

  AccountUpdatePageCubit.add() : super(AccountUpdatePageInitial()) {
    _addInitialize();
  }

  AccountUpdatePageCubit.update(Account account)
      : super(AccountUpdatePageInitial()) {
    _updateInitialize(account);
  }

  void _addInitialize() {
    _title = 'Добавить';

    _bodyCubit = AccountUpdatePageBodyCubit.add();

    emit(AccountUpdatePageShow(_title, _bodyCubit));
  }

  void _updateInitialize(Account account) {
    _title = 'Редактировать';

    _bodyCubit = AccountUpdatePageBodyCubit.update(account);

    emit(AccountUpdatePageShow(_title, _bodyCubit));
  }
}
