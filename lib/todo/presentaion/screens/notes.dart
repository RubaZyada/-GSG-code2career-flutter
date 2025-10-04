//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo/data/notes_model.dart';
import 'package:gsg_flutter/todo/data/notes_shared_db.dart';
import 'package:gsg_flutter/todo/data/notes_sqlite_db.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';
import 'package:gsg_flutter/todo/presentaion/widgets/note_widget.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NotesModel> notes = [];

  final String noteskey = 'notes';

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Add a Note',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      cont: titleController,
                      hintText: 'Enter your title',
                    ),

                    CustomTextField(
                      cont: contentController,
                      hintText: 'Enter your content',
                    ),

                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          NotesModel note = NotesModel(
                            title: titleController.text,
                            content: contentController.text,
                            date:
                                "${DateTime.now().day} ${DateTime.now().month}",
                          );
                          notes.add(note);
                          NotesSqliteDb.insertNoteToDb(note);
                          contentController.clear();
                          titleController.clear();
                        });
                       // NotesSharedDb.updateListAtSharedDb(notes);
                        Navigator.pop(context);
                      },
                      child: const Text('Add Note'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text(
                'No notes available. Tap + to add a new note.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteWidget(
                  note: notes[index],
                  onDismissed: (direction) {
                    NotesModel removedNote = notes[index];
                    setState(() {
                      notes.removeAt(index);
                    });
                   // NotesSharedDb.updateListAtSharedDb(notes);
                    if (notes.isEmpty) {
                      setState(() {
                        // Show a message or perform an action when the notes list is empty
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Note deleted'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            setState(() {
                              notes.insert(index, removedNote);
                            });
                           // NotesSharedDb.updateListAtSharedDb(notes);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
//sqflite 
  fetchList() async {
    try {
   
      setState(() {
      
      });
    } catch (e) {
      print('Error fetching notes: $e');
    
    }
  }
  //shared prefs
  // fetchList() async {
  //   try {
  //     var fetchList = await NotesSharedDb.fetchListFromSharedDb();
  //     setState(() {
  //       notes = fetchList;
  //     });
  //   } catch (e) {
  //     print('Error fetching notes: $e');
  //     // Optionally, clear corrupted data
  //     // NotesSharedDb.prefs.remove(noteskey);
  //   }
  // }

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  /*import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/notes_model.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
 // List<NotesModel> notes = [];
   List<String> notes = [];
  final String noteskey = 'notes';
  // بدون نعمل مودل
  TextEditingController noteController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Add a Note',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                     
                    TextField(
                         controller: noteController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your note',
                        prefixIcon: Icon(Icons.note),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // CustomTextField(
                    //   cont: titleController,
                    //   hintText: 'Enter your title',
                    // ),

                    // CustomTextField(
                    //   cont: contentController,
                    //   hintText: 'Enter your content',
                    // ),

                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                        //   NotesModel note = NotesModel(
                        //     title: titleController.text,
                        //     content: contentController.text,
                        //     date:
                        //         "${DateTime.now().day} ${DateTime.now().month}",
                        //   );
                        //   notes.add(note);
                        //   contentController.clear();
                        //   titleController.clear();
                          
                              notes.add(noteController.text);
                             noteController.clear();
                        });
                        updateList();
                        Navigator.pop(context);
                      },
                      child: const Text('Add Note'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text(
                'No notes available. Tap + to add a new note.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      notes.removeAt(index);
                    });
                    updateList();
                    if (notes.isEmpty) {
                      setState(() {
                        // Show a message or perform an action when the notes list is empty
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Note deleted'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            setState(() {
                              notes.insert(index, notes[index]);
                            });
                            updateList();
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                   child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ const Icon(Icons.note, color: Colors.blueAccent)
                    , const SizedBox(width: 12),
                     Expanded( 
                        child: Text( notes[index],
                         style: const TextStyle( fontSize: 16,
                          fontWeight: FontWeight.w500,
                           color: Colors.black87, ), ), ),]
                    // child: ListTile(
                    //   title: Text(
                    //     notes[index].title,
                    //     style: const TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     notes[index].content,
                    //     style: const TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    //   trailing: Text(notes[index].date),
                    // ),
                  ),
                  )
                );
              },
            ),
    );
  }
  // لما بدي اسنخدمهم ارجع الnote list to string type not notemodel

    updateList() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(noteskey, notes);
    }

    fetchList() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    notes = prefs.getStringList(noteskey) ?? [];
  });

 }


}

*/
  //note model
  //  updateList() async {
  // final prefs = await SharedPreferences.getInstance();
  // prefs.setStringList(noteskey, notes);
  //  }

  //  fetchList() async {
  // final prefs = await SharedPreferences.getInstance();
  // setState(() {
  //   notes = prefs.getStringList(noteskey) ?? [];
  // });
  //
}
