import 'package:akasztofa/alerts/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorDialog extends BaseDialog {
  
  ErrorDialog({required super.title, required super.content, required super.actions});

  @override
  void show(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: width * 0.8,
            height: height * 0.35,
            child: Column(
              children: [
                content,
                 Lottie.network(
                            "https://lottie.host/58f38db2-0da3-4180-9eab-8943d6ead328/Q6r2xVgRUv.json"
                ),
              ],
            ),
          ),
          actions: actions, 
        );
      },
    );
  }

}
