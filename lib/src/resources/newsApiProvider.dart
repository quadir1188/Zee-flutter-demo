import 'package:news_app/src/helpers/appImages.dart';
import 'package:news_app/src/models/newsResponseModel.dart';
import 'package:http/http.dart';

import '../models/newsDetailsResponse.dart';

class NewsApiProvider {
  Client client = Client();

  Future<List<NewsData>> fetchNewsList({String category = ''}) async {
    var url = "https://jsonkeeper.com/b/0Y0J";
    // print("entered Url : $url");
    final response = await client.get(Uri.parse(url));
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return NewsApiResonse.fromRawJson(response.body).news;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<NewsDetail> fetchNewsDetail({String  detailUrl}) async {
    print("data here $detailUrl");
    // print("entered Url : $url");
    final response = await client.get(Uri.parse(detailUrl));
    // print(response.body.toString());
    if (response.statusCode == 200) {
      print("data here $response");
      // If the call to the server was successful, parse the JSON
      return NewsDetailsResponse.fromRawJson(response.body).newsDetail;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


}
