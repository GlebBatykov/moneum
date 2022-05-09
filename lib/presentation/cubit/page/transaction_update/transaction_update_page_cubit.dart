import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moneum/domain/model/transaction.dart';

import 'body/transaction_update_page_body_cubit.dart';

part 'transaction_update_page_state.dart';

class TransactionUpdatePageCubit extends Cubit<TransactionUpdatePageState> {
  late final String _title;

  late final TransactionUpdatePageBodyCubit _bodyCubit;

  TransactionUpdatePageCubit.add() : super(TransactionUpdatePageInitial()) {
    _addInitialize();
  }

  TransactionUpdatePageCubit.update(Transaction transaction)
      : super(TransactionUpdatePageInitial()) {
    _updateInitialize(transaction);
  }

  void _addInitialize() {
    _title = 'Добавить';

    _bodyCubit = TransactionUpdatePageBodyCubit.add();

    emit(TransactionUpdatePageShow(_title, _bodyCubit));
  }

  void _updateInitialize(Transaction transaction) {
    _title = 'Редактировать';

    _bodyCubit = TransactionUpdatePageBodyCubit.update();

    emit(TransactionUpdatePageShow(_title, _bodyCubit));
  }
}
