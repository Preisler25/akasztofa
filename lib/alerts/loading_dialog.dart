import 'package:akasztofa/alerts/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends BaseDialog {
   
  LoadingDialog({super.title = "Error"});

  @override
  void show(BuildContext context, Widget content, List<Widget> actions) {
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
                            'https://lottie.host/6703ec01-2389-48d5-b897-9da53630d662/4Kj3CZv8eP.json'
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
