import 'package:akasztofa/alerts/error_dialog.dart';
import 'package:akasztofa/components/char_display.dart';
import 'package:akasztofa/components/inputs.dart';
import 'package:akasztofa/utils/game_provider.dart';
import 'package:akasztofa/utils/guess_provider.dart';
import 'package:akasztofa/utils/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';



class GamePage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  GamePage({super.key});
  
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
      ErrorDialog ed = ErrorDialog(title: 'Something went wrong!');
       return
      Scaffold( 
        appBar: AppBar( 
          title: Row(
            children: [
              const Text(
                'Akasztófa', 
                style: 
                  TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.brown
                  ),
                ),
              Builder(builder: (context) {
               if(context.read<LoadingProvider>().isLoading) {
                return SizedBox(child: Lottie.network('https://lottie.host/6703ec01-2389-48d5-b897-9da53630d662/4Kj3CZv8eP.json'), height: 40, width: 40); 
                }
                return Container();
              }
              ),
            ],
          ),
          backgroundColor: Colors.brown,
        ),
        backgroundColor: Colors.brown,
        body: SafeArea(
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column( 
                    children: [
                      Text(context.watch<GameProvider>().gameInfo.word.join(' '), style: const TextStyle(fontSize: 30)),
                      CharInput(
                        label: 'Guess a letter', 
                        inputType: TextInputType.text,
                        controller: widget.controller,
                      ),
                    ElevatedButton(
                
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                
                      onPressed: () {
                        if (widget.controller.text.isEmpty || context.read<GuessProvider>().guessedLetters.contains(widget.controller.text)) {
                          ed.show(context, const Text('Please enter a letter u have not guessed', style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),), [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, 
                              child: const Text('OK'),
                            ),
                          ]); 
                          return;
                        }
                        context.read<GameProvider>().guessLetter(context, widget.controller.text);
                        context.read<GuessProvider>().addGuessedLetter(widget.controller.text);
                        context.read<GuessProvider>().setText('');
                        widget.controller.clear();
                      }, 
                      child: const Text('Guess'),
                    ),
                     const SizedBox(height: 100),
                
                    CharDisplay(),
                    ],
                ),             
                          ),
              ),
            ),
        ), 
      );
  }
}

