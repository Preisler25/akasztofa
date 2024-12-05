import 'package:akasztofa/alerts/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FailDialog extends BaseDialog {
  
  FailDialog({required super.title});

  @override
  void show(BuildContext context , Widget content, List<Widget> actions) {
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
                  "https://lottie.host/82dbd7f9-1540-4fd0-b42f-5d374e19e738/9cB9eplhir.json"
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
