import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String) onChanged;
  final TextInputType? inputType;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const InputText(
      {super.key,
      required this.label,
      required this.hintText,
      required this.onChanged,
      this.inputType,
      this.leadingIcon,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
            prefixIcon: leadingIcon != null ? Icon(leadingIcon) : null,
            suffixIcon: trailingIcon != null ? Icon(trailingIcon) : null,
            label: Text(label),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.white.withOpacity(0.9),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never),
      ),
    );
  }
}
