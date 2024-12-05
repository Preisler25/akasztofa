import 'package:akasztofa/utils/guess_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  
  const CharInput({super.key, 
    required this.label,
    required this.controller,
    required this.inputType,
 });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLength: 1,
      onChanged: (value) {
        context.read<GuessProvider>().setText(value);
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }
}
