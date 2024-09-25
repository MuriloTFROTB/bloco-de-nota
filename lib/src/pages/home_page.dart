import 'package:flutter/material.dart';
import 'package:ui_notes/src/database/firebase_databse.dart';
import 'package:ui_notes/src/model/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseDatabse _db = FirebaseDatabse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Anotação',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createNote');
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: const Color.fromRGBO(59, 59, 59, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: _db.getNotes(),
          builder: (context, snapshot) {
            List notes = snapshot.data?.docs ?? [];
            if (notes.isEmpty) {
              return Center(
                child: Text(
                  'Sem notas',
                ),
              );
            }
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                Note note = notes[index].data();
                String noteId = notes[index].id;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(59, 59, 59, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          note.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          note.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            _db.deleteNote(noteId);
                          },
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
