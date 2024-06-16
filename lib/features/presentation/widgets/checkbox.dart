import 'package:flutter/material.dart';

class CheckBoxWithText extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Function(bool) onChanged;

  const CheckBoxWithText({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CheckBoxWithText> createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<CheckBoxWithText> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.title),
        Checkbox(
          value: isChecked,
          activeColor: Colors.black,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
            widget.onChanged(value!);
          },
        ),
      ],
    );
  }
}
