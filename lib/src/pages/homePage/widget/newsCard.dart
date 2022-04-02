import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/models/newsResponseModel.dart';
import 'package:news_app/src/pages/newsDetail/bloc/bloc.dart';
import 'package:news_app/src/theme/theme.dart';

class NewsCard extends StatelessWidget {
  final NewsData artical;
  final bool isVideoNews;
  final String type;
  const NewsCard(
      {Key key, this.artical, this.isVideoNews = false, this.type = ''})
      : super(key: key);
  Widget _playWidget(BuildContext context) {
    return SizedBox(
      height: 20,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          height: 10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).bottomAppBarColor),
          child: Icon(
            Icons.play_arrow,
            color: Theme.of(context).disabledColor,
            size: 3,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("url here ${artical.url}");
        BlocProvider.of<DetailBloc>(context)
            .add(FetchDetails(url: artical.url));
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                        color: Theme.of(context).primaryColor,
                        child: artical.thumbnailUrl == null ||
                                artical.thumbnailUrl.isEmpty
                            ? Container()
                            : customImage(artical.thumbnailUrl,
                                fit: BoxFit.cover)),
                    isVideoNews ? _playWidget(context) : Container()
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                Container(
                  height: 52,
                  child: Text(
                    artical.title,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Row(
                  children: <Widget>[

                    Text(
                      artical.getDateOnly(),
                      style: AppTheme.subTitleStyle,
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
