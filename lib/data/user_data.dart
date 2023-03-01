import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

class UserData {
  String baseUrl = 'http://192.168.1.6:8000/api';

  Future login(String email, String password) async {
    String baseUrl = this.baseUrl + '/login';

    var headers = {
      'Accept': 'application/json',
    };
    var body = {
      'email': email,
      'password': password,
    };

    var response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: body,
    );

    dynamic userData = json.decode(response.body)['data'];

    if (userData != null) {
      SessionManager sessionManager = SessionManager();
      await sessionManager.set("id", userData['user']['id']);
      await sessionManager.set("name", userData['user']['name']);
      await sessionManager.set("email", userData['user']['email']);
      await sessionManager.set("phone", userData['user']['phone']);
      await sessionManager.set("address", userData['user']['address']);
      await sessionManager.set("token", userData['token']);
      await sessionManager.set("isLoggedIn", true);

      return true;
    }
    print(json.decode(response.body));

    return false;
  }
}
