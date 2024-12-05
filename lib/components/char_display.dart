import 'package:akasztofa/utils/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharDisplay extends StatelessWidget{
  const CharDisplay({super.key});

  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 400,
      height: 600,
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
    if (context.watch<GameProvider>().gameInfo.word.isEmpty)
      Center(
        child: Text("No words available"),
      )
    else
      Expanded(
        child: ListView.builder(
          itemCount: context.watch<GameProvider>().gameInfo.word.length,
          itemBuilder: (context, index) {
            final word = context.watch<GameProvider>().gameInfo.word[index];
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
