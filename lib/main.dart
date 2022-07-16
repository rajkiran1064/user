import 'package:flutter/material.dart';
import 'package:user_model/Screens/HomeScreen.dart';
import 'package:user_model/Screens/LoginScreen.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.teal
      ),
      routes: {
        '/': (ctx) => const LoginScreen(),
        '/home': (ctx) => HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}


