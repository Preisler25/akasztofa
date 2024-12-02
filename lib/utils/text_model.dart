import 'package:flutter/material.dart';

class TextModel extends ChangeNotifier {
  String _text = '';

  String get text => _text;

  void setText(String text) {
    _text = text;
    print('TextModel: $text');
    notifyListeners();
  }
}
