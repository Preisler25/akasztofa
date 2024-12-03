import 'package:flutter/material.dart';

class BaseDialog {
  String title;
  Widget content;
  List<Widget> actions;

  BaseDialog({required this.title, required this.content, required this.actions});

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: actions, 
        );
      },
    );
  }
}
