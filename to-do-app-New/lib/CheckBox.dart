import 'package:flutter/material.dart';

class checkBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  const checkBox({super.key, required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: onChanged,
    );
  }
}
