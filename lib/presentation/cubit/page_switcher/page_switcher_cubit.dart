import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:moneum/presentation/cubit/application_bar/application_bar_cubit.dart';

part 'page_switcher_state.dart';

class PageSwitcherCubit extends Cubit<PageSwitcherState> {
  final ApplicationBarCubit _applicationBarCubit =
      GetIt.instance<ApplicationBarCubit>();

  PageSwitcherCubit() : super(PageSwitcherAccounts()) {
    _applicationBarCubit.showAccounts();
  }

  void showAccounts() {
    emit(PageSwitcherAccounts());

    _applicationBarCubit.showAccounts();
  }

  void showLog() {
    emit(PageSwithcerLog());

    _applicationBarCubit.showLog();
  }

  void showReport() {
    emit(PageSwitcherReport());

    _applicationBarCubit.showReport();
  }

  void showScheduled() {
    emit(PageSwitcherScheduled());

    _applicationBarCubit.showScheduled();
  }

  void showScheduler() {
    emit(PageSwitcherScheduler());

    _applicationBarCubit.showScheduler();
  }

  void showBackup() {
    emit(PageSwitcherReport());

    _applicationBarCubit.showBackup();
  }
}
