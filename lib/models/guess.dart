class Guess {
  bool inTheWord;
  List<int> indexes;

  Guess(this.inTheWord, this.indexes);

  static Guess fromJson(Map<String, dynamic> json) {
    print('fromJson called');
    try {
      // Parse inTheWord directly if it's already a boolean
      bool inTheWord = json['inTheWord'];

      // Parse indexes directly if it's already a list of integers
      List<int> indexes = List<int>.from(json['indexes']);

      // Create and return the Guess object
      return Guess(inTheWord, indexes);
    } catch (e) {
      print('Failed to parse guess from JSON: $e');
      throw Exception('Failed to parse guess from JSON: $e');
    }
  }
}
