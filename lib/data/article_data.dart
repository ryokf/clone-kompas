import 'dart:convert';

import 'package:http/http.dart' as http;

class ArticleData {
  String baseUrl = 'http://192.168.1.11:8000/api';

  Future<dynamic> getArticle({String? id}) async {
    String baseUrl = this.baseUrl + '/article';

    if (id != null) {
      String baseUrl = this.baseUrl + '/article?id=' + id;
      var response = await http.get(Uri.parse(baseUrl));

      Map<String, dynamic> data = json.decode(response.body)['data'];
      return data;
    }

    var response = await http.get(Uri.parse(baseUrl));

    List<dynamic> data = json.decode(response.body)['data'];

    return data;
  }
}
