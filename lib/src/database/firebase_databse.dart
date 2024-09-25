import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_notes/src/model/note_model.dart';

class FirebaseDatabse {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late final CollectionReference _noteref;

  FirebaseDatabse() {
    _noteref = _db.collection('notes').withConverter<Note>(
          fromFirestore: (snapshots, _) => Note.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (note, _) => note.toJson(),
        );
  }
  Stream<QuerySnapshot> getNotes() {
    return _noteref.snapshots();
  }

  void addNote(Note note) async {
    _noteref.add(note);
  }

  void updatedNote(String noteId, Note note) {
    _noteref.doc(noteId).update(note.toJson());
  }

  void deleteNote(String noteId) {
    _noteref.doc(noteId).delete();
  }
}
