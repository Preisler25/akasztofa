import 'package:akasztofa/models/server_error.dart';

class GameInfo {
  int wordLength;
  late List<String> word = List.filled(wordLength, '');
  ServerError? serverError;
  GameInfo(this.wordLength, this.serverError);

  static fromJson(json) {
    return GameInfo(json['wordLength'], ServerError.fromJson(json['serverError']));
  }
}
