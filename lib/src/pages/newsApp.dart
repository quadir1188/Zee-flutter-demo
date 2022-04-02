import 'package:flutter/material.dart';
import 'package:news_app/src/helpers/appImages.dart';
import 'package:news_app/src/theme/color/dark_color.dart';
import 'package:news_app/src/theme/color/lightColor.dart';
import '../models/CategoryNewsModel.dart';
import 'homePage/homePage.dart';
import 'profile/profilePage.dart';

class NewsApp extends StatefulWidget {
  NewsApp({Key key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  PageController _controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(AppImages.logo,width: 100,height: 100,),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child:GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/profile');},
            child: Container(
              width: 60,
              height: 60,
              child: Icon(Icons.person,),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: LightColor.red,)
            ),
          ),
        )],
      ),

      body: HomePage(

      ),
    );
  }
}
