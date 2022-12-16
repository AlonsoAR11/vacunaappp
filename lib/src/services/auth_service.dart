import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebasekey = 'AIzaSyDxXXNcn5xKk5dzNvSLe6SV_X9AmsUk4is';

  final storage = const FlutterSecureStorage();

  //Register

  Future<String?> createUser(String email, String password) async {
    final Map<dynamic, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebasekey,
    });

    final response = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResponse = jsonDecode(response.body);

    if (decodeResponse.containsKey('idToken')) {
      storage.write(key: 'token', value: decodeResponse['idToken']);
      return null;
    } else {
      return decodeResponse['error']['message'];
    }
  }

  //Login
  Future<String?> login(String email, String password) async {
    final Map<dynamic, dynamic> authData = {
      'email': email,
      'password': password,
    };

    print(email + '-' + password);

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebasekey,
    });

    final response = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResponse = jsonDecode(response.body);

    if (decodeResponse.containsKey('idToken')) {
      storage.write(key: 'token', value: decodeResponse['idToken']);
      return null;
    } else {
      return decodeResponse['error']['message'];
    }
  }

  //Logout
  Future cerrarSesion() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> leerToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
