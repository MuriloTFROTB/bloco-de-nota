import 'package:flutter/material.dart';
import 'package:ui_notes/src/database/firebase_databse.dart';
import 'package:ui_notes/src/model/note_model.dart';

class CreateNote extends StatefulWidget {
  CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  FirebaseDatabse _db = FirebaseDatabse();

  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        title: Text(
          'Notas',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Note note = Note(
                  title: titleController.text,
                  text: textController.text,
                );
                _db.addNote(note);
              },
              child: Center(
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Write yout titlte',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(99, 99, 99, 1),
                    fontSize: 32,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white70, fontSize: 28),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Write yout titlte',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(99, 99, 99, 1),
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
