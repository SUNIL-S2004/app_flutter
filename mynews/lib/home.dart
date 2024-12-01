import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'countries.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _defaultCountryCode = "in";

  Future<Map<String, dynamic>> fetchNews(String countryCode) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=a1eaec2dc47c495bb8474c61570bfa53'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot news'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          FloatingActionButton(
            onPressed: () async {
              var countrycode = await Navigator.of(context).pushNamed(
                Countries.router,
              );
              if (countrycode != null && countrycode.toString().isNotEmpty) {
                setState(() {
                  _defaultCountryCode = countrycode.toString();
                });
              }
            },
            child: Text(
              'country',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchNews(_defaultCountryCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load news'),
            );
          } else {
            var articles = snapshot.data!['articles'];
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        articles[index]['urlToImage'] ??
                            "https://www.google.com/imgres?q=images&imgurl=https%3A%2F%2Fwww.simplilearn.com%2Fice9%2Ffree_resources_article_thumb%2Fwhat_is_image_Processing.jpg&imgrefurl=https%3A%2F%2Fwww.simplilearn.com%2Fimage-processing-article&docid=NMmM-IXyCkU2hM&tbnid=x-vCr75bhEc-WM&vet=12ahUKEwj3_oyrnvaGAxWUTGwGHVSwCkwQM3oECGcQAA..i&w=848&h=477&hcb=2&ved=2ahUKEwj3_oyrnvaGAxWUTGwGHVSwCkwQM3oECGcQAA",
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Container(
                            height: 200,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        articles[index]['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
