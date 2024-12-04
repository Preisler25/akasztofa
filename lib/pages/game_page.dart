import 'package:akasztofa/alerts/check_dialog_false.dart';
import 'package:akasztofa/alerts/check_dialog_succes.dart';
import 'package:akasztofa/alerts/error_dialog.dart';
import 'package:akasztofa/utils/game_provider.dart';
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
  void initState() {
    super.initState();
    // Call setGameInfo when the widget is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameProvider>().setGameInfo(context);
    });
  }

  @override
  Widget build(BuildContext context) {   
   
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
                  const SizedBox(height: 20), 
                    Text(context.watch<GameProvider>().gameInfo.wordLength.toString(), style: const TextStyle(fontSize: 30)),


              ], 
              ),
             
          ),
        ), 
      );
  }
}

