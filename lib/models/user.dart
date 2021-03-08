import 'package:flutter/material.dart';

enum UserState {
  uninitiated,
  tokenPresent,
  loggedIn,
}

class User {
  String? token;
  UserState state = UserState.uninitiated;

  User(String username) {
    this.token = username;
  }

  Map<String, dynamic> toJson() {
    return {
      "token": this.token,
    };
  }

  User.fromJson(Map<String, dynamic> json) {
    this.token = json["token"];
    this.state = UserState.tokenPresent;
  }
}
