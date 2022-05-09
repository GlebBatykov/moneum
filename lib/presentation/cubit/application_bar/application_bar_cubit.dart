import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moneum/presentation/cubit/page/log_page/log_page_cubit.dart';
import 'package:moneum/presentation/cubit/search_bar/search_bar_cubit.dart';
import 'package:poseidon/poseidon.dart';

import '../../ui/search_bar/search_bar.dart';

part 'application_bar_state.dart';

class ApplicationBarCubit extends Cubit<ApplicationBarState> {
  ApplicationBarCubit() : super(ApplicationBarInitial()) {
    showAccounts();
  }

  void showAccounts() {
    emit(ApplicationBarAccounts('Счета', () {
      Poseidon.instance.navigate('/add-account');
    }));
  }

  void showLog() {
    emit(ApplicationBarLog('Журнал', () {
      Poseidon.instance.navigate('/add-transaction');
    },
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: BlocProvider<SearchBarCubit>.value(
                value: GetIt.instance<LogPageCubit>().searchBarCubit,
                child: const SearchBar()))));
  }

  void showReport() {
    emit(ApplicationBarReport(
        'Отчет',
        () {},
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: BlocProvider<SearchBarCubit>.value(
                value: GetIt.instance<LogPageCubit>().searchBarCubit,
                child: const SearchBar()))));
  }

  void showScheduled() {
    emit(ApplicationBarScheduled('Запланированно', () {}));
  }

  void showScheduler() {
    emit(ApplicationBarScheduler('Планировщик', () {}));
  }

  void showBackup() {
    emit(ApplicationBarBackup('Резерв. копии и облако', () {}));
  }
}
