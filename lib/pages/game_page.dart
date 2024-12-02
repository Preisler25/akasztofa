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

    print('HomePage build');

    return
      Scaffold( appBar: AppBar( title: const Text('Akasztófa'), backgroundColor: Colors.blue, ), body: Center(child: Column( children: [ Text(context.watch<TextModel>().text), ElevatedButton( onPressed: () { print('Button pressed'); context.read<TextModel>().setText('Szilva'); }, child: const Text('Change text'), ), ], ), ), );
  }
}

