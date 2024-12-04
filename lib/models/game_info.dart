import 'package:akasztofa/models/game_state.dart';

class GameInfo {
  int wordLength;
  GameState gameState;
  late List<String> word;

  GameInfo(this.wordLength, this.gameState)
  {
    print('GameInfo constructor');
    print('wordLength: $wordLength');
    word = List.filled(wordLength, '');
  }

  static GameInfo fromJson(Map<String, dynamic> json) {
  print('fromJson called');
  try {
    // Parse wordLength directly if it's already an integer
    int wordLength = json['wordLength'];

    // Convert gameState string to GameState enum
    String gameStateString = json['gameStatus'];
    GameState gameState = GameState.values.firstWhere(
      (e) => e.toString().split('.').last == gameStateString,
      orElse: () {
        throw Exception('Invalid gameState value: $gameStateString');
      },
    );

    // Create and return the GameInfo object
    return GameInfo(wordLength, gameState);
  } catch (e) {
    print('Failed to parse game info from JSON: $e');
    throw Exception('Failed to parse game info from JSON: $e');
  }
}

}
