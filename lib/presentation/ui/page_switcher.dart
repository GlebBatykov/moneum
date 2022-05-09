import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moneum/presentation/cubit/page_switcher/page_switcher_cubit.dart';
import 'package:moneum/presentation/ui/page/accounts/accounts_page.dart';
import 'package:moneum/presentation/ui/page/backup_page.dart';
import 'package:moneum/presentation/ui/page/log/log_page.dart';
import 'package:moneum/presentation/ui/page/report_page.dart';
import 'package:moneum/presentation/ui/page/scheduled_page.dart';
import 'package:moneum/presentation/ui/page/scheduler_page.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSwitcherCubit, PageSwitcherState>(
        bloc: GetIt.instance<PageSwitcherCubit>(),
        builder: (context, state) {
          if (state is PageSwitcherAccounts) {
            return const AccountsPage();
          } else if (state is PageSwithcerLog) {
            return const LogPage();
          } else if (state is PageSwitcherReport) {
            return const ReportPage();
          } else if (state is PageSwitcherScheduled) {
            return const ScheduledPage();
          } else if (state is PageSwitcherScheduler) {
            return const SchedulerPage();
          } else {
            return const BackupPage();
          }
        });
  }
}
