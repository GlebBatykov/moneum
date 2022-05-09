import 'package:flutter/material.dart';

class ContentDivider extends StatelessWidget {
  final EdgeInsets? margin;

  final Axis axis;

  const ContentDivider({Key? key, this.margin, this.axis = Axis.horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? Container(
            height: 1,
            margin: margin ?? EdgeInsets.zero,
            color: Colors.white.withOpacity(0.15))
        : Container(
            width: 1,
            margin: margin ?? EdgeInsets.zero,
            color: Colors.white.withOpacity(0.15));
  }
}
