import 'package:akasztofa/pages/game_page.dart';
import 'package:akasztofa/utils/text_model.dart';
//import 'package:akasztofa/utils/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TextModel(),
    child: const AkasztoFaApp(),
  ));
}

class AkasztoFaApp extends StatefulWidget {
  const AkasztoFaApp({super.key});

  @override
  State<AkasztoFaApp> createState() => _AkasztoFaAppState();
}

class _AkasztoFaAppState extends State<AkasztoFaApp> {
  

  @override  
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akasztófa',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: GamePage(),
    );
  }
}
