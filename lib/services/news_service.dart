import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article.dart';

class NewsServices {
  Dio dio = Dio();
  Future<List<Article>> getData(
      {required String path, required Map<String, dynamic> query}) async {
    Response response = await dio.get(path, queryParameters: query);
    Map<String, dynamic> jsonData = response.data;
    List articles = jsonData["articles"];
    List<Article> articleList = [];
    for (var article in articles) {
      if (article["urlToImage"] == null) {
        continue;
      }
      articleList.add(Article(
          title: article["title"] ?? "No Title",
          description: article["description"] ?? "No description",
          urlToImage: article["urlToImage"]));
    }
    return articleList;
  }
}
