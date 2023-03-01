import 'package:flutter/material.dart';
import 'package:frontend/data/article_data.dart';
import 'package:frontend/screens/detail_news_page.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/widget/news_tile.dart';

class HomePage extends StatelessWidget {
  Future<void> loadingData(context) async {
    ArticleData articleData = ArticleData();

    List<dynamic> articles = await articleData.getArticle();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _HomePage(articles)));
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

  _HomePage(this.articles);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int currentIndex = 0;
  Widget makePopularNews() {
    return Container();
  }

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
          Image.asset(
            'assets/icon-profile.png',
            width: 26,
          ),
          SizedBox(
            width: 46,
          ),
        ],
      ),
      body: ListView(children: makeNews(context)),
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
