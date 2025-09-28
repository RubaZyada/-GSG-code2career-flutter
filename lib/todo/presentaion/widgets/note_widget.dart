import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo/data/notes_model.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key,  this.onDismissed, required this.note});
  final void Function(DismissDirection)? onDismissed;
  final NotesModel note;

  @override
  Widget build(BuildContext context) {
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
                  onDismissed: onDismissed,
                  // onDismissed: (direction) {
                  //   setState(() {
                  //     notes.removeAt(index);
                  //   });
                  //   updateList();
                  //   if (notes.isEmpty) {
                  //     setState(() {
                  //       // Show a message or perform an action when the notes list is empty
                  //     });
                  //   }
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('Note deleted'),
                  //       action: SnackBarAction(
                  //         label: 'UNDO',
                  //         onPressed: () {
                  //           setState(() {
                  //             notes.insert(index, notes[index]);
                  //           });
                  //           updateList();
                  //         },
                  //       ),
                  //     ),
                  //   );
                  // },
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

                    child: ListTile(
                      title: Text(
                        note.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        note.content,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Text(note.date),
                    ),
                  )
                );
  }
}