import 'package:flutter/material.dart';

AppBar customAppBar({
  Widget? flexibleSpace,
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    flexibleSpace: flexibleSpace,
    title: title,
    leading: leading,
    actions: actions,
  );
}
