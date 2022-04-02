import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/pages/newsDetail/bloc/bloc.dart';
import 'package:news_app/src/resources/repositoryDetails.dart';
import 'package:news_app/src/resources/repositoryNews.dart';


class DetailBloc extends Bloc<DetailsEvent, DetailState> {
  final RepositoryNewsDetails repository;

  DetailBloc({this.repository}) : super(LoadingDetails());

  @override
  Stream<DetailState> mapEventToState(DetailsEvent event) async* {
    if (event is FetchDetails) {
      try {
        yield LoadingDetails();
        final items = await repository.fetchNewsDetails(url: event.url);
        yield LoadedDetails(newsDetail: items, type: event.url);
      } catch (error) {
        log("Error", error: error);
        yield FailureDetails();
      }
    }
  }
}
