import 'package:flutter/material.dart';

class CustomTextFieldTheme {
  static InputDecorationTheme get light => InputDecorationTheme(
        filled: true,
        border: _buildOutlineInputBorder(color: Colors.blue.shade50),
        fillColor: Colors.grey.shade100,
        enabledBorder: _buildOutlineInputBorder(color: Colors.blue.shade50),
        focusedBorder: _buildOutlineInputBorder(color: Colors.blue),
        errorBorder: _buildOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: _buildOutlineInputBorder(color: Colors.red),
        hintStyle: TextStyle(color: Colors.grey.shade600), // Adjust as needed
      );

  static OutlineInputBorder _buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
