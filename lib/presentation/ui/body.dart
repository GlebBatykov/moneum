import 'package:flutter/material.dart';
import 'package:moneum/presentation/ui/application_bar.dart';
import 'package:moneum/presentation/ui/page_switcher.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [ApplicationBar(), Expanded(child: PageSwitcher())],
    );
  }
}
