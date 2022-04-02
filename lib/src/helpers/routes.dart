import 'package:flutter/material.dart';

import 'package:news_app/src/pages/homePage/homePage.dart';
import 'package:news_app/src/pages/newsApp.dart';
import 'package:news_app/src/pages/newsDetail/newsDetailPage.dart';
import 'package:news_app/src/pages/profile/profilePage.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
          '/': (_) => NewsApp(),
          '/home': (_) => HomePage(),
          '/detail': (_) => NewsDetailPage(),
          '/profile': (_) => ProfilePage(),
        };
  }
}