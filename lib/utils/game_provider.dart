import 'package:akasztofa/models/game_info.dart';
import 'package:akasztofa/models/server_error.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  GameInfo? _gameInfo; 
  GameInfo? get gameInfo => _gameInfo;

  void setGameInfo(GameInfo gameInfo) {
    _gameInfo = gameInfo;
    notifyListeners();
  }

  void resetGameInfo() {
    _gameInfo = null;
    notifyListeners();
  }

  void updateGameInfo(GameInfo gameInfo) {
    _gameInfo = gameInfo;
    notifyListeners();
  }

  void updateWord(List<String> word) {
    _gameInfo!.word = word;
    notifyListeners();
  }

  void updateServerError(ServerError serverError) {
    _gameInfo!.serverError = serverError;
    notifyListeners();
  }

  void updateWordLength(int wordLength) {
    _gameInfo!.wordLength = wordLength;
    notifyListeners();
  }
}
