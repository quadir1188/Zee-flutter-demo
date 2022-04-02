import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/theme/bloc/bloc.dart';
import 'package:news_app/src/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  Widget _headerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: customAdvanceNetworkImage(
                    'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg'),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('User Name',
                      style: AppTheme.h2Style
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text('Gold Reader', style: AppTheme.h5Style),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Divider()
        ],
      ),
    );
  }

  Widget _estimateWidget(String text, String count) {
    return Expanded(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(count,
              style: AppTheme.h4Style.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(text, style: AppTheme.h5Style),
        ],
      )),
    );
  }

  Widget _settingRow(
      BuildContext context, IconData icon1, String text, bool isEnable,
      {Color color = Colors.black, int index = 0}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: isEnable
          ? Theme.of(context).primaryColor.withAlpha(100)
          : Theme.of(context).backgroundColor,
      child: Row(
        children: <Widget>[
          Icon(
            icon1,
          ),
          SizedBox(width: 10),
          Text(text,
              style: AppTheme.h4Style.copyWith(
                fontWeight: FontWeight.bold,
              )),
          Expanded(child: SizedBox()),
          isEnable == null
              ? Container()
              : Switch(
                  activeColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Theme.of(context).disabledColor,
                  onChanged: (value) {
                    if (index == 1) {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(isEnable ? DarkMode() : LightMode());
                    }
                  },
                  value: isEnable,
                )
        ],
      ),
    );
  }

  Widget _logout(BuildContext context, IconData icon1, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon1,
            color: Theme.of(context).errorColor,
          ),
          SizedBox(width: 10),
          Text(text,
              style: AppTheme.h3Style.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).errorColor)),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            bool val = false;
            if (state is SelectedTheme) {
              val = state.themeType == ThemeType.Light ? true : false;
            }
            return SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: _headerWidget(context),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _settingRow(
                            context, Icons.lightbulb_outline, 'Night', val,
                            index: 1),

                      ],
                    ),
                  ))
                ],
              ),
            );
          },
        ));
  }
}
