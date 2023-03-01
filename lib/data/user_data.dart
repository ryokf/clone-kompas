import 'dart:convert';

import 'package:http/http.dart' as http;

class UserData {
  String baseUrl = 'http://192.168.1.6:8000/api';

  Future login(String email, String password) async {
    String baseUrl = this.baseUrl + '/login';

    var headers = {
      'Accept': 'application/json',
    };

    // String email = 'ryokhrisnaf@gmail.com';
    // String password = 'rahasia';

    var body = {'email': email, 'password': password};

    var response =
        await http.post(Uri.parse(baseUrl), headers: headers, body: body);

    print(json.decode(response.body));

    return json.decode(response.body);
  }
}
