import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_model/Models/Authentication.dart';

import '../Models/User.dart';
class EndPoint {
  
  static Future<dynamic> checkUser(Authentication authentication) async {
    print(authentication.toJson());
    print(jsonEncode(authentication.toJson()));
    final response = await http.post(
      Uri.parse('https://restful-booker.herokuapp.com/auth'),
      body: jsonEncode(authentication.toJson())
    );
    return response;
  }
  static Future<List<User>> getUsers() async {
    final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=1')
    );
    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body)['data'];
      return userListFromJson(users);
    } else {
      return [];
    }
  }
}