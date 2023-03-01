import 'package:flutter/material.dart';
import 'package:frontend/data/article_data.dart';
import 'package:frontend/screens/home_page.dart';
import 'package:frontend/screens/login_page.dart';

class DetailNewsPage extends StatelessWidget {
  String id;
  String? token;

  DetailNewsPage(this.id, [this.token = null]);

  Future<void> loadingData(context) async {
    ArticleData articleData = ArticleData();

    Map<String, dynamic> article = await articleData.getArticle(id: id);

    if (token == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => _DetailNewsPage(article)));
    }
  }

  @override
  Widget build(BuildContext context) {
    loadingData(context);
    return Scaffold(
      body: Center(child: Text('wait...')),
    );
  }
}

class _DetailNewsPage extends StatelessWidget {
  Map<String, dynamic> article;

  _DetailNewsPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              int counter = 0;
              Navigator.popUntil(context, (route) {
                return counter++ == 2;
              });
            },
            child: Text('back'),
          )),
      body: Center(
        child: Text(article['title']),
      ),
    );
  }
}
