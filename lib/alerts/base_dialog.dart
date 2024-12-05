import 'package:flutter/material.dart';

class BaseDialog {
  String title;
 
  BaseDialog({required this.title});

  void show(BuildContext context, Widget content, List<Widget> actions) {
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
