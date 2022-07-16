
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_model/Models/Authentication.dart';

import '../Api/endPoints.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}
class LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  bool registeredUser = true;
  Authentication authentication = Authentication(password: '', userName: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
      ),
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                     userNameField(),
                    const SizedBox(height: 30),
                    passwordField(),
                    const SizedBox(height: 30),
                    signIn()
                  ],
                ),
              ),
            ),
          )
      ),

    );
  }


  Widget userNameField() {
    return
      TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        validator: (String ? value){
          if (value!.isEmpty) {
            return 'user name should not be empty';
          }
        },
        onChanged: (String ? value){
          setState((){
            authentication.userName = value!;
          });
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            ),

            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            focusColor: Theme.of(context).primaryColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            labelText: 'userName'
        ),
      );
  }
  Widget passwordField(){
    return TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        validator: (String ? value){
          if (value!.isEmpty) {
            return 'password should not be empty';
          }
        },
        onChanged: (String ? value){
          setState((){
            authentication.password = value!;
          });
        },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          focusColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          labelText: 'Password'
      ),
    );
  }

  Widget signIn() {
    return InkWell(
              onTap: onLoginPressed,
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(60)
                ),
                child: const Text('Sign Up',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600

                )),
              ));
  }
  void onLoginPressed() async{
    if(_formKey.currentState!.validate()) {
      print(jsonEncode(authentication.toJson()));
      final response = await EndPoint.checkUser(authentication);
      print(jsonDecode(response.body));
      if (response.statusCode == 200){
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User name or password is incorrect')));
      }
    }
  }
}

