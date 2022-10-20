import 'package:flutter/material.dart';
import 'package:flutter_lesson_3/pages/home/home_screen.dart';
import 'package:flutter_lesson_3/pages/sign_in/sing_in_page.dart';
import 'package:flutter_lesson_3/pages/sign_up/sing_up_page.dart';
import 'package:flutter_lesson_3/utils/prefs/prefs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/sign_in': (context) => const SignInPage(),
        '/sign_up': (context) => const SignUPPage()
      },
      home: FutureBuilder(
        future: Prefs.loadData<String>(key: 'token'),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return const HomeScreen();
          }
          return const SignInPage();
        },
      ),
    );
  }
}
