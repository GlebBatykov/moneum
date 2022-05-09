import 'package:flutter/material.dart';
import 'package:moneum/presentation/ui/home.dart';
import 'package:poseidon/poseidon.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Poseidon.instance.navigationKey,
      scaffoldMessengerKey: Poseidon.instance.scaffoldMessengerKey,
      title: 'Moneum',
      home: const Home(),
    );
  }
}
