import 'package:akasztofa/alerts/base_dialog.dart';
import 'package:akasztofa/models/game_info.dart';
import 'package:akasztofa/models/game_state.dart';
import 'package:akasztofa/utils/game_info_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameProvider extends ChangeNotifier {
  GameInfo _gameInfo = GameInfo(0, GameState.INITIAL); 
  GameInfo get gameInfo => _gameInfo;
 
  void setGameInfo(BuildContext context) async {
  print('setGameInfo');
  
  BaseDialog(title: 'Loading', content: Lottie.network('https://lottie.host/6703ec01-2389-48d5-b897-9da53630d662/4Kj3CZv8eP.json'), actions: []).show(context);

  try {
    // Fetch the API for the game info
    GameInfo gameInfo = await GameInfoHelper().getGameInfo(context);
    
      print('gameInfo: ${gameInfo.wordLength}');

    // If the API call is successful
    _gameInfo = gameInfo;
    notifyListeners();
  } catch (e) {
    // Show an error dialog if the API call fails
    
  } finally {
    // Remove the loading dialog
    Future.delayed(Duration(seconds: 10)).then((value) => Navigator.pop(context));
  }
}

   void resetGameInfo() {
    _gameInfo = GameInfo(0, GameState.INITIAL);
    notifyListeners();
  }

  void updateGameInfo(GameInfo gameInfo) {
    _gameInfo = gameInfo;
    notifyListeners();
  }

  void updateWord(List<String> word) {
    _gameInfo.word = word;
    notifyListeners();
  }

  void updateWordLength(int wordLength) {
    _gameInfo.wordLength = wordLength;
    notifyListeners();
  }
}
