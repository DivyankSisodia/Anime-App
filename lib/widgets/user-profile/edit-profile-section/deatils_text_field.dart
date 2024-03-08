import 'package:flutter/material.dart';

class DetailFormField extends StatelessWidget {
  const DetailFormField({
    super.key,
    required this.labelText,
    required this.icon, required this.controller,
  });

  final String labelText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon:
            Icon(icon, color: Colors.white), // Use the provided icon here
      ),
    );
  }
}
