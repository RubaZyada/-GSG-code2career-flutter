

import 'dart:convert';

class NotesModel {
  String title;
  String content;
String date;

  NotesModel({required this.title, required this.content, required this.date});
 //   واخزنها في shared prefs حتى احول من اوبجكت الى سترينق
  String toJson(){
    return  jsonEncode({'title': title, 'date': date, 'content': content});
  }
  // لازم طول ما انا عاملة tojson
  NotesModel.fromjson(Map<String ,dynamic>json):
  title = json['title'],
  date=json ['date'],
  content= json['content'];

}