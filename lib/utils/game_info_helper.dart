import 'package:akasztofa/alerts/error_dialog.dart';
import 'package:akasztofa/models/game_info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class GameInfoHelper {
 Future<GameInfo> getGameInfo(BuildContext context) async {
  try {
      print('trying to fetch game info');
       final response = await http.get(Uri.parse('https://preisler.saserver.hu/hangman/start'));
    if (response.statusCode == 200) {
      print('start the conversion');
      print('response: ${response.body}');
      return GameInfo.fromJson(jsonDecode(response.body));
    } else {
      ErrorDialog ed = ErrorDialog(
        title: 'Something went worng!',
        content: const Text('Failed to load game info from the server'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('Ok')
          ),
        ],
      );
      ed.show(context);
      throw new Exception('Failed to load game info');
      }
    
     } catch (e) {
      ErrorDialog ed = ErrorDialog(
        title: 'Something went worng!',
        content: const Text('Failed to load game info'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('Ok')
          ),
        ],
      );
      ed.show(context);
      throw new Exception('Failed to load game info'); 
     }
  }
}
