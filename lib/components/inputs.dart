import 'package:flutter/material.dart';

class CharInput extends StatelessWidget {
  final String label;
  final TextEditingController controller = TextEditingController();
  final TextInputType inputType;
  
  CharInput({
    required this.label,
    required this.inputType,
 });


  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLength: 1,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }
}
