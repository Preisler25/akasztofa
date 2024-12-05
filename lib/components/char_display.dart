import 'package:akasztofa/utils/guess_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharDisplay extends StatefulWidget{
   CharDisplay({super.key});

  @override
  State<CharDisplay> createState() => _CharDisplayState();
}

class _CharDisplayState extends State<CharDisplay> {
  @override
  Widget build(BuildContext context) {
    double width = 0;
    double height = 0;

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    setState(() {
      width = _width * 0.8;
      height = _height * 0.3;
    });

    return AnimatedContainer(
      width: width,
      height: height,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
  children: [
    if (context.watch<GuessProvider>().guessedLetters.isEmpty)
      Center(
        child: Text("No guessedLetters yet"),
      )
    else
      Expanded(
        child: ListView.builder(
          itemCount: context.watch<GuessProvider>().guessedLetters.length,
          itemBuilder: (context, index) {
            final word = context.watch<GuessProvider>().guessedLetters[index];
            return ListTile(
              title: Text(word),
            );
          },
        ),
      ),
  ],
)
    );
  }
}
