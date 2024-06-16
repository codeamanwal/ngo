import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].

class DropdownMenuWidget extends StatefulWidget {
  final List<String> menuOptions;
  final Function(String) onChanged;
  const DropdownMenuWidget(
      {super.key, required this.menuOptions, required this.onChanged});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.menuOptions.first;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      double width = constraint.maxWidth;
      double height = constraint.maxHeight;
      return DropdownMenu<String>(
        initialSelection: widget.menuOptions.first,
        width: width,
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
          widget.onChanged(dropdownValue);
        },
        dropdownMenuEntries:
            widget.menuOptions.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      );
    });
  }
}
