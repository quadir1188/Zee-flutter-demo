import 'package:news_app/src/models/newsResponseModel.dart';
import 'newsApiProvider.dart';

class RepositoryNews {
  final newsApiProvider = NewsApiProvider();
  Future<List<NewsData>> fetchAllNews({String category = ''}) => newsApiProvider.fetchNewsList(category:category);
}