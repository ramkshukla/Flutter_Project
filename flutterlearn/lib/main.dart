import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/util/sharedPreference/shared_pref.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPref().init();
  runApp(const MyApp());
}



// import 'package:flutter/material.dart';
// import 'package:flutterlearn/module/demo/todo_model.dart';

// import 'module/demo/todo_Screen.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Passing Data',
//       home: TodosScreen(
//         todos:list,
//       ),
//     ),
//   );
// }
