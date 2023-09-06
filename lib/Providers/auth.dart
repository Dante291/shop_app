import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class auth extends ChangeNotifier {
  late String token;
  late DateTime _expirydate;
  late String _userId;

  Future<void> signup(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAXILj9RL7nzf0pITiyxNcAYGu3lMdRWS4');
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAXILj9RL7nzf0pITiyxNcAYGu3lMdRWS4');
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
  }
}