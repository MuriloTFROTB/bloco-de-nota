import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_notes/firebase_options.dart';
import 'package:ui_notes/src/pages/create_note.dart';
import 'package:ui_notes/src/pages/display_note.dart';
import 'package:ui_notes/src/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(),
      routes: {
        '/createNote': (context) => CreateNote(),
        '/homePage': (context) => HomePage(),
        '/displayNote': (context) => DisplayNote(),
      },
      home: HomePage(),
    );
  }
}
