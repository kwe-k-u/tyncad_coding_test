import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:tyncad_test/models/app_state.dart';
import 'package:tyncad_test/screens/sign_in/sign_in.dart';

void main() async{
   await dotenv.load(fileName: ".env.test");
  runApp(ChangeNotifierProvider(
    create: (_)=> AppState(),
    builder: (context, widget) =>const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        canvasColor: const Color(0xFFFCDDDD),
        iconTheme: const IconThemeData(
          color:  Colors.red
        )
      ),
      home:  const SignIn(),
    );
  }
}
