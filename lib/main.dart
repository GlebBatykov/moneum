import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;
import 'package:intl/intl.dart';
import 'package:moneum/injection_container.dart';
import 'package:moneum/presentation/navigation/navigation_builder.dart';
import 'package:moneum/presentation/ui/application.dart';
import 'package:moneum/system_chrome_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'ru';

  await intl.initializeDateFormatting();

  await InjectionContainer().initialize();

  NavigationBuilder().build();

  SystemChromeConfiguration().configure();

  runApp(const Application());
}
