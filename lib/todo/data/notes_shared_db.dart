import 'dart:convert';

import 'package:gsg_flutter/todo/data/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesSharedDb {

  static late final SharedPreferences prefs;
  static final String notesKey = 'notes';

  static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
    print('SharedPrefs initialized');
  }

  static updateListAtSharedDb(List<NotesModel> notes) async {
    List<String> notesAsStrings = [];
    for (var note in notes) {
      notesAsStrings.add(note.toJson());
    }
    prefs.setStringList(notesKey, notesAsStrings);
  }

 static Future<List<NotesModel>> fetchListFromSharedDb() async {
    final prefs = await SharedPreferences.getInstance();
    var notesAsStrings = prefs.getStringList(notesKey) ?? [];

    List<NotesModel> notes = [];

    for (var n in notesAsStrings) {
      var noteDecoded = jsonDecode(n);
      NotesModel note = NotesModel.fromjson(noteDecoded);
      notes.add(note);
    }
    return notes;
  }
}