import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String? label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Function() onPressed;
  const LargeButton(
      {super.key,
      this.label,
      this.leadingIcon,
      this.trailingIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: CupertinoButton(
            color: Colors.blueAccent,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(leadingIcon),
                Text(
                  label ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(trailingIcon)
              ],
            )),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final String? label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Function() onPressed;
  const CardButton(
      {super.key,
      this.label,
      this.leadingIcon,
      this.trailingIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: FilledButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(leadingIcon),
                Text(
                  label ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(trailingIcon)
              ],
            )),
      ),
    );
  }
}
