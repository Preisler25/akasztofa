import 'package:flutter/material.dart';

class GuessProvider extends ChangeNotifier {
  String _text = '';
  List<String> _guessedLetters = [];

  List<String> get guessedLetters => _guessedLetters;
  String get text => _text;

  void setText(String text) {
    _text = text;
    print('GuessProvider: $text');
    notifyListeners();
  }

  void addGuessedLetter(String letter) {
    _guessedLetters.add(letter);
    notifyListeners();
  }
}
