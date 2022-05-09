import 'package:get_it/get_it.dart';
import 'package:moneum/presentation/cubit/application_bar/application_bar_cubit.dart';
import 'package:moneum/presentation/cubit/drawer_menu/drawer_menu_cubit.dart';
import 'package:moneum/presentation/cubit/page/accounts/accounts_page_cubit.dart';
import 'package:moneum/presentation/cubit/page/log_page/log_page_cubit.dart';
import 'package:moneum/presentation/cubit/page_switcher/page_switcher_cubit.dart';

class InjectionContainer {
  Future<void> initialize() async {
    var getIt = GetIt.instance;

    getIt.registerLazySingleton<DrawerMenuCubit>(() => DrawerMenuCubit());

    getIt.registerSingleton(ApplicationBarCubit());

    getIt.registerSingleton(PageSwitcherCubit());

    getIt.registerLazySingleton(() => AccountsPageCubit());

    getIt.registerLazySingleton(() => LogPageCubit());
  }
}
