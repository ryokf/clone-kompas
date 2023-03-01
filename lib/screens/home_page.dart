import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:frontend/data/article_data.dart';
import 'package:frontend/screens/detail_news_page.dart';
import 'package:frontend/screens/login_page.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/widget/news_tile.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
  // Map userData;

  // HomePage(this.userData);

  Future<void> loadingData(context) async {
    ArticleData articleData = ArticleData();
    List<dynamic> articles = await articleData.getArticle();

    dynamic getUser = await SessionManager().get('id');

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _HomePage(articles, getUser)));
  }

  @override
  Widget build(BuildContext context) {
    loadingData(context);
    return Scaffold(
      body: Center(child: Text('wait...')),
    );
  }
}

class _HomePage extends StatefulWidget {
  List<dynamic> articles;
  dynamic user;

  _HomePage(this.articles, this.user);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int currentIndex = 0;

  List<Widget> makeNews(context) {
    List<Widget> tiles = [];

    widget.articles.forEach((article) {
      Widget tile = GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailNewsPage(article['id'].toString())));
          },
          child: NewsTile(
            article['title'],
            article['category']['name'],
            article['thumbnail'],
            article['created_at'],
          ));
      tiles.add(tile);
    });

    return tiles;
  }

  Widget bookmark() {
    return Center(
      child: Text('bookmark page'),
    );
  }

  menu() {
    return Center(
      child: Text(widget.user.toString()),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return ListView(children: makeNews(context));
      case 1:
        return bookmark();
      case 2:
        return menu();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logo-kompas.png',
          width: 168,
          height: 30,
        ),
        titleSpacing: 59,
        actions: [
          Image.asset(
            'assets/icon-search.png',
            width: 24,
          ),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Image.asset(
              'assets/icon-profile.png',
              width: 26,
            ),
          ),
          SizedBox(
            width: 46,
          ),
        ],
      ),
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            print(value);
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Hari ini',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Baca nanti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: subtitleColor,
        showUnselectedLabels: true,
      ),
    );
  }
}
