import 'package:akasztofa/alerts/error_dialog.dart';
import 'package:akasztofa/alerts/loading_dialog.dart';
import 'package:akasztofa/models/game_info.dart';
import 'package:akasztofa/models/game_state.dart';
import 'package:akasztofa/models/guess.dart';
import 'package:akasztofa/utils/game_helper.dart';
import 'package:akasztofa/utils/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GameProvider extends ChangeNotifier {
  GameInfo _gameInfo = GameInfo(0, GameState.INITIAL); 
  GameInfo get gameInfo => _gameInfo;
  
  LoadingDialog ld = LoadingDialog(title: 'Loading');
  ErrorDialog ed = ErrorDialog(title: 'Something went worng!');

  void setGameInfo(BuildContext context) async {
  print('setGameInfo');
  context.read<LoadingProvider>().setLoading(true);


  try {
    // Fetch the API for the game info
    GameInfo gameInfo = await GameHelper().getGameInfo(context);
    
      print('gameInfo: ${gameInfo.wordLength}');

    // If the API call is successful
    _gameInfo = gameInfo;
    notifyListeners();
  } catch (e) {
    // Show an error dialog if the API call fails
    ed.show(context, const Text('Something went wrong!'), [
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
      ),
      ]);
  } finally {
    // Remove the loading dialog
    context.read<LoadingProvider>().setLoading(false); 
  }
}

   void resetGameInfo() {
    _gameInfo = GameInfo(0, GameState.INITIAL);
    notifyListeners();
  }

  void guessLetter(BuildContext context, String letter) async {
    try {
      
      //Build Loding dialog
      ld.show(context, const Text('Loading'), []);

      // Fetch the API for the guess correction
      Guess guess = await GameHelper().getGuess(context, letter);
      

      // If the API call is successful and in the word
      if (guess.inTheWord){
        for (int i = 0; i < guess.indexes.length; i++) {
          //for each index chang letter 
          _gameInfo.word[guess.indexes[i]] = letter;
        }
      }
      else {
        
      }
      notifyListeners();
      
      //context.pop
      if (Navigator.canPop(context)){
         Navigator.pop(context);
      }
    } catch (e) {
      // Show an error dialog if the API call fails
    }
  }
}
