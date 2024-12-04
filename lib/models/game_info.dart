class GameInfo {
  int wordLength;
  late List<String> word = List.filled(wordLength, '');
 
  GameInfo(this.wordLength);

  static fromJson(json) {
    return GameInfo(json['word_length']);
  }
}
