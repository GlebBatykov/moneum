part of 'application_bar_cubit.dart';

@immutable
abstract class ApplicationBarState {}

class ApplicationBarInitial extends ApplicationBarState {}

class ApplicationBarShow extends ApplicationBarState {
  final String title;

  final void Function() plusIconOnPressed;

  final Widget? content;

  final bool isBottomBorderVisible;

  ApplicationBarShow(this.title, this.plusIconOnPressed, this.content,
      this.isBottomBorderVisible);
}

class ApplicationBarAccounts extends ApplicationBarShow {
  ApplicationBarAccounts(String title, void Function() plusIconOnPressed)
      : super(title, plusIconOnPressed, null, true);
}

class ApplicationBarLog extends ApplicationBarShow {
  ApplicationBarLog(
      String title, void Function() plusIconOnPressed, Widget? content)
      : super(title, plusIconOnPressed, content, false);
}

class ApplicationBarReport extends ApplicationBarShow {
  ApplicationBarReport(
      String title, void Function() plusIconOnPressed, Widget? content)
      : super(title, plusIconOnPressed, content, false);
}

class ApplicationBarScheduled extends ApplicationBarShow {
  ApplicationBarScheduled(String title, void Function() plusIconOnPressed)
      : super(title, plusIconOnPressed, null, false);
}

class ApplicationBarScheduler extends ApplicationBarShow {
  ApplicationBarScheduler(String title, void Function() plusIconOnPressed)
      : super(title, plusIconOnPressed, null, true);
}

class ApplicationBarBackup extends ApplicationBarShow {
  ApplicationBarBackup(String title, void Function() plusIconOnPressed)
      : super(title, plusIconOnPressed, null, true);
}
