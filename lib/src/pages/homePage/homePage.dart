import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/models/newsResponseModel.dart';
import 'package:news_app/src/pages/newsDetail/bloc/bloc.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/models/newsResponseModel.dart';
import 'bloc/bloc.dart';
import 'widget/newsCard.dart';

class HomePage extends StatelessWidget {
  Widget _headerNews(NewsData article) {
    return Builder(
      builder: (context) {
        return InkWell(
            onTap: () {
              print("url here ${article.url}");
              final detailBloc = BlocProvider.of<DetailBloc>(context);
              detailBloc.add(DetailsEvent(url: article.url));
              Navigator.pushNamed(context, '/detail');
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Hero(
                  tag: 'headerImage',
                  child: article.thumbnailUrl == null
                      ? Container()
                      : customImage(article.thumbnailUrl),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                      // stops: [.1, .9],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(article.title,
                          style: AppTheme.h4Style.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface)),
                      Text(
                        article.getTime(),
                        style: AppTheme.subTitleStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _body(
    BuildContext context,
    List<NewsData> list, {
    String type,
  }) {
    return CustomScrollView(
      slivers: <Widget>[

        SliverToBoxAdapter(
          child: _headerNews(list.first),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => NewsCard(
                      artical: list[index],
                      type: type.toUpperCase(),
                    ),
                childCount: list.length))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).backgroundColor,
        statusBarColor: Theme.of(context).backgroundColor));
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state == null) {
              return Center(child: Text('Null block'));
            }
            if (state is Failure) {
              return Center(child: Text('Something went wrong'));
            }
            if (state is Loaded) {
              if (state.items == null || state.items.isEmpty) {
                return Text('No content avilable');
              } else {
                return _body(context, state.items, type: state.type);
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
