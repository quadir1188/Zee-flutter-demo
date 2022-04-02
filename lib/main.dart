

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/simple_bloc_delegate.dart';
import 'package:news_app/src/resources/repositoryDetails.dart';
import 'package:news_app/src/theme/bloc/theme_bloc.dart';
import 'package:news_app/src/theme/bloc/theme_state.dart';
import 'package:news_app/src/theme/theme.dart';
import 'src/helpers/routes.dart';
import 'src/pages/homePage/bloc/bloc.dart';
import 'src/pages/newsDetail/bloc/bloc.dart';
import 'src/resources/repositoryNews.dart';

void main() {
  BlocObserver observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData apptheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) =>
          NewsBloc(repository: RepositoryNews())..add(Fetch(type: 'General')),
        ),
        BlocProvider<DetailBloc>(create: (context) => DetailBloc(repository: RepositoryNewsDetails())..add(FetchDetails(url: 'General'))),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SelectedTheme) {
            apptheme = state.themeType != ThemeType.Light
                ? AppTheme.lightTheme
                : AppTheme.darkTheme;
          }
          return Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Zee News Demo',
                theme: apptheme,
                debugShowCheckedModeBanner: false,
                routes: Routes.getRoute(),
              );
            },
          );
        },
      ),
    );
  }
}
