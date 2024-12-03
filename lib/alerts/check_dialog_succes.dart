import 'package:akasztofa/alerts/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesDialog extends BaseDialog {
  
  SuccesDialog({required super.title, required super.content, required super.actions});

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
                            "https://lottie.host/10c0ef49-0da2-4bb7-885b-106797bef08c/lDNWxLlxGA.json"
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
