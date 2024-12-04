import 'package:akasztofa/alerts/check_dialog_false.dart';
import 'package:akasztofa/alerts/check_dialog_succes.dart';
import 'package:akasztofa/alerts/error_dialog.dart';
import 'package:akasztofa/utils/text_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> { 

  @override
  Widget build(BuildContext context) {   

    FailDialog fd = FailDialog(
      title: 'Thats it!',
      content: const Text('Wrong!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('OK')
        ),
      ],
    );

    SuccesDialog sd = SuccesDialog(
      title: 'Thats it!',
      content: const Text('Correct!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('OK')
        ),
      ],
    );

    ErrorDialog ed = ErrorDialog(
      title: 'Thats it!',
      content: const Text('Correct!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('OK')
        ),
      ],
    );

    return
      Scaffold( 
        appBar: AppBar( 
          title: const Text('Akasztófa', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.brown,
        ), 
        body: SafeArea( 
          
            child: SingleChildScrollView(
              child: Column( 
                children: [
                              
                  Text(context.watch<TextModel>().text), 
                  ElevatedButton( 
                    onPressed: () { 
                      print('Button pressed'); 
                      sd.show(context);
                      context.read<TextModel>().setText('Szilva');
                    }, 
                    child: const Text('Change text'), 
                  ), 
                  ElevatedButton(
                    onPressed: () {
                      fd.show(context);
                      context.read<TextModel>().setText('Körte');
                    }, 
                    child: const Text('Change text'), 
                  ),
                   ElevatedButton(
                    onPressed: () {
                      ed.show(context);
                      context.read<TextModel>().setText('Alma');
                    }, 
                    child: const Text('Change text'), 
                  )

                ], 
              ),
             
          ),
        ), 
      );
  }
}

