import 'package:akasztofa/alerts/error_dialog.dart';
import 'package:akasztofa/models/game_info.dart';
import 'package:akasztofa/models/guess.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class GameHelper {

  Future<Guess> getGuess(BuildContext context, String letter) async {
    ErrorDialog ed = ErrorDialog(title: 'Something went worng!');
    try {
      final response = await http.get(Uri.parse('https://preisler.saserver.hu/hangman/guess?letter=$letter'));
      if (response.statusCode == 200) {
        return Guess.fromJson(jsonDecode(response.body));
      } else {
        ed.show(context, const Text('Server error'), [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('Ok')
          ),
        ]);
        throw new Exception('Failed to load guess');
      }
    } catch (e) {
      ed.show(context, const Text('Failed to load guess'), [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('Ok')
        ),
      ]);
      throw new Exception('Failed to load guess');
    }
  }


 Future<GameInfo> getGameInfo(BuildContext context) async {
  ErrorDialog ed = ErrorDialog(title: 'Something went worng!');
    try {
      print('trying to fetch game info');
       final response = await http.get(Uri.parse('https://preisler.saserver.hu/hangman/start'));
    if (response.statusCode == 200) {
      print('start the conversion');
      print('response: ${response.body}');
      return GameInfo.fromJson(jsonDecode(response.body));
    } else {
      ed.show(context, const Text('Server error'), [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('Ok')
        ),
      ]);
      throw new Exception('Failed to load game info');
      }
    
     } catch (e) {
     ed.show(context, const Text('Failed to load game info'), [
       TextButton(
         onPressed: () => Navigator.pop(context), 
         child: const Text('Ok')
       ),
      ]);
      throw new Exception('Failed to load game info'); 
     }
  }

}
