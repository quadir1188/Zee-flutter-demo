import 'package:news_app/src/models/newsDetailsResponse.dart';
import 'package:news_app/src/models/newsResponseModel.dart';
import 'newsApiProvider.dart';

class RepositoryNewsDetails {
  final newsApiProvider = NewsApiProvider();
  Future<NewsDetail> fetchNewsDetails({String url }) => newsApiProvider.fetchNewsDetail(detailUrl:url);
}