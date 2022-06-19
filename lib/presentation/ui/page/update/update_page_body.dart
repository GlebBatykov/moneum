import 'package:flutter/material.dart';

class UpdatePageBody extends StatelessWidget {
  final List<Widget> children;

  const UpdatePageBody({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();

          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
