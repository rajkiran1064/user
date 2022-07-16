import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
  return SplashScreenState();
  }
}
class SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {

   return Scaffold(
   appBar: AppBar(
     title: const Text('User Verification'),
   ),
     body: const Center(
       child: CircularProgressIndicator(),
     ),
   );
  }

}