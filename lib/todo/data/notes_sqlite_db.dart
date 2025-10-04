import 'package:gsg_flutter/todo/data/notes_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesSqliteDb {
  static String dbpath = 'notes.db';
  static late Database _database;
  static String tableName = 'notes';
  static String columnId = 'id';
  static String columnTitle = 'title';
  static String columnContent = 'content';
  static String columnDate = 'date';
  static Future<void> init() async {
    //initialize the database
    _database = await openDatabase(
      dbpath,
      version: 1,
      // هادي الفنكشن مرة وحدة تستخدم عند انشاء التيبل
      onCreate: (db, version) async {
        // Create the notes table
        print('onCreate db called');

        await db.execute('''
                    CREATE TABLE $tableName (
                        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                        $columnTitle TEXT,
                        $columnContent TEXT,
                        $columnDate TEXT
                    )
                ''');
      },
      // تفتح الداتا بيس وتعطيني منها اوبجكت
      onOpen: (db) {
        //read existing data
        print('onOpen db called');
      },
    );
  }

  //operations crud
  //insert ( هادي وين بدي استدعيها؟)
 static insertNoteToDb(NotesModel NotesModel) async{
    int id = await _database.rawInsert(
      'INSERT INTO $tableName ($columnTitle, $columnContent, $columnDate) VALUES ("${NotesModel.title
      }", "${NotesModel.content}", "${NotesModel.date}")',
      [NotesModel.title, NotesModel.content, NotesModel.date],
    );
    print('Inserted note with id: $id');
  }
}
