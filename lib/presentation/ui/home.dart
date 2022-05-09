import 'package:flutter/material.dart';
import 'package:moneum/presentation/ui/body.dart';
import 'package:moneum/presentation/ui/drawer_menu/drawer_menu.dart';
import 'package:poseidon/poseidon.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: Poseidon.instance.scaffoldKey,
      backgroundColor: Colors.black,
      body: const Body(),
      drawer: const DrawerMenu(),
    );
  }
}
