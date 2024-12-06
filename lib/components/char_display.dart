import 'package:akasztofa/utils/guess_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharDisplay extends StatefulWidget{
   CharDisplay({super.key});

  @override
  State<CharDisplay> createState() => _CharDisplayState();
}


class _CharDisplayState extends State<CharDisplay> {
 
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        width = MediaQuery.of(context).size.width * 0.8;
        height = MediaQuery.of(context).size.height * 0.3;
      });
    });

    return AnimatedContainer(
      width: width,
      height: height,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
                title: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(word, style: const TextStyle(color: Colors.white, fontSize: 20),)),
                ),
            ),
            );  
              },
        ),
      ),
  ],
)
    );
  }
}
