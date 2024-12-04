import 'package:akasztofa/models/game_info.dart';

class GameInfoHelper {
  static String word = 'almal';

  Future<GameInfo> getGameInfo() async {
    
    Future.delayed(const Duration(seconds: 1));

    return GameInfo(5);
  }
}
