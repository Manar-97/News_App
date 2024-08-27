import 'dart:convert';
import 'dart:ffi';
import 'package:news_app/data/model/article_response.dart';
import 'package:news_app/data/model/source_response.dart';
import 'package:http/http.dart';

abstract class ApiManager {
  static const String _apiKey = "a7c5cdad0dae43578c4282145ceb7595";
  static const String _baseUrl = "https://newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articleEndPoint = "/v2/everything";

  static Future<SourcesResponse> getSources(String categoryId) async {
    Response serverResponse =
        await get(Uri.parse('$_baseUrl$_sourcesEndPoint?apiKey=$_apiKey&category=$categoryId'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      SourcesResponse response = SourcesResponse.fromJson(json);
      return response;
    } else {
      throw "Something went wrong please try again later";
    }
  }

  static Future<ArticlesResponse> getArticle(String? sourceId) async {
    Response serverResponse =
    await get(Uri.parse('$_baseUrl$_articleEndPoint?apiKey=$_apiKey&sources=$sourceId'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      return ArticlesResponse.fromJson(json);
    } else {
      throw "Something went wrong please try again later";
    }
  }

  static Future<ArticlesResponse> searchArticles(String query) async {
    Response serverResponse =
    await get(Uri.parse('$_baseUrl$_articleEndPoint?apiKey=$_apiKey&q=$query'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      return ArticlesResponse.fromJson(json);
    } else {
      throw "Something went wrong please try again later";
    }
  }

  static Future<ArticlesResponse> getPagingArticle(String? sourceId,int? currentPage) async {
    Response serverResponse =
    await get(Uri.parse('$_baseUrl$_articleEndPoint?apiKey=$_apiKey&sources=$sourceId&page=$currentPage'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body) as Map;
      return ArticlesResponse.fromJson(json);
    } else {
      throw "Something went wrong please try again later";
    }
  }

}
