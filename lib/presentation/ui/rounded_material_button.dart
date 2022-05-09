import 'package:flutter/material.dart';

class RoundedMaterialButton extends StatelessWidget {
  final void Function()? onTap;

  final Widget child;

  final BorderRadius? borderRadius;

  final List<BoxShadow>? boxShadow;

  const RoundedMaterialButton(
      {Key? key,
      required this.child,
      this.onTap,
      this.boxShadow,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                boxShadow: boxShadow,
                color: Colors.transparent),
            child: child,
          ),
        ),
      ),
    );
  }
}
