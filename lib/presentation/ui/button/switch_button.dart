import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';

class SwitchButton extends StatelessWidget {
  final bool value;

  final void Function(bool) onToggle;

  const SwitchButton({Key? key, required this.value, required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        width: 43 * 1.2,
        height: 23 * 1.2,
        padding: 2,
        activeColor: HexColor('#6E00FF'),
        inactiveColor: Colors.white.withOpacity(0.15),
        value: value,
        onToggle: onToggle);
  }
}
