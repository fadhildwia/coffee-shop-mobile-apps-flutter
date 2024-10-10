import 'package:flutter/material.dart';

class CustomTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onPressed;

  const CustomTabButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? const Color.fromRGBO(198, 124, 78, 1)
              : const Color.fromARGB(255, 248, 177, 177),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color:
                isSelected ? Colors.white : const Color.fromRGBO(49, 49, 49, 1),
          ),
        ),
      ),
    );
  }
}
