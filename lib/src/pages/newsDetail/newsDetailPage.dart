import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/models/newsDetailsResponse.dart';
import 'package:news_app/src/models/newsResponseModel.dart';
import 'package:news_app/src/pages/homePage/bloc/bloc.dart';
import 'package:news_app/src/theme/theme.dart';

import 'bloc/bloc.dart';

class NewsDetailPage extends StatelessWidget {
  Widget _headerNews(BuildContext context, NewsDetail article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(
          tag: 'headerImage',
          child: article.thumbnailUrl == null || article.thumbnailUrl.isEmpty
              ? Container()
              : customImage(article.thumbnailUrl),
        ),

      ],
    );
  }

  Widget _body(BuildContext context, NewsDetail article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerNews(context, article),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(article.title, style: AppTheme.h1Style),
              SizedBox(
                height: 10,
              ),

              Text(article.timestamp, style: AppTheme.subTitleStyle),
              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
              ),
              Html(data:article.content ?? '')
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          leading:  IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.keyboard_backspace,
              color: Theme.of(context).primaryColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],

        ),
        body: SafeArea(child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state == null) {
              return Center(child: Text('Null bloc'));
            }
            if (state is Failure) {
              return Center(child: Text('Something went wrong'));
            }
            if (state is LoadedDetails) {
              if (state.newsDetail == null) {
                return Text('No content avilable');
              } else {
                return _body(
                  context,
                  state.newsDetail,
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )));
  }
}
