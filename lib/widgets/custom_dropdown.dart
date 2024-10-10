import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      hint: const Text(
        'Select Location',
        style: TextStyle(
          color: Color.fromRGBO(216, 216, 216, 1),
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Color.fromRGBO(216, 216, 216, 1),
      ),
      iconSize: 24,
      elevation: 16,
      underline: Container(),
      style: const TextStyle(
        color: Color.fromRGBO(216, 216, 216, 1),
        fontWeight: FontWeight.w600,
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              color: Color.fromRGBO(216, 216, 216, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }
}
