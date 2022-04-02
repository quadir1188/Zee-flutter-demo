import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/resources/repositoryNews.dart';
import 'newsEvent.dart';
import 'newsState.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final RepositoryNews repository;

  NewsBloc({this.repository}) : super(Loading());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is Fetch) {
      try {
        yield Loading();
        final items = await repository.fetchAllNews(category: event.type);
        yield Loaded(items: items, type: event.type);
      } catch (error) {
        log("Error", error: error);
        yield Failure();
      }
    }
  }
}
