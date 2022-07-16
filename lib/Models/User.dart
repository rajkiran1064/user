import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class User {
  int ? id;
  String  firstName;
  String  lastName;
  String  email;
  String imgUrl;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imgUrl

  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id:json["id"],
      firstName:json['first_name'],
      lastName:json['last_name'],
      email:json['email'],
      imgUrl: json['avatar'],

  );

}

List<User> userListFromJson(List<dynamic> users) => List<User>.from(users.map((user) => User.fromJson(user)));





