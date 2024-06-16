import 'package:flutter/material.dart';

AppBar BuildAppBarWithTitle(BuildContext context, String title,
    {bool? automaticallyImplyLeading}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    backgroundColor: Colors.white.withOpacity(0.5),
  );
}
