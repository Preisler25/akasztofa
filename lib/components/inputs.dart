import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  _InputsState createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Írj be egy betűt',
      ),
      onSubmitted: (String value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Beírtál: $value'),
          ),
        );
        _controller.clear();
      },
    );
  }
}
