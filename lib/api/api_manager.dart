import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

import 'api_constants.dart';
class ApiManager{
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=6b5aedac670a400c9779e5753afd5586
  ///   website name --> newsapi.org
  ///   API NAME --> /v2/top-headlines/sources
  ///   APIKEY --> MAP OF { 'apiKey' , '6b5aedac670a400c9779e5753afd5586'

   */
  static Future<SourceResponse?> getSource(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId
    });
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    }
    catch(e){
      throw e ;

    }
  }
  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=6b5aedac670a400c9779e5753afd5586
   */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources' : sourceId
    });
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }
    catch(e){
      throw e ;

    }
  }
  /*--------------------------------------------------------------------*/
/*  static Future<NewsResponse?> getNewsDetails(int id) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'api_key': ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return NewsResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
 */
  /*--------------------------------------------------------------------*/
  static Future<NewsResponse?> getNewsByCategory(String category) async {
    final Uri url = Uri.https(ApiConstants.baseUrl, '/v2/top-headlines', {
        'category': category,
        'apiKey': ApiConstants.apiKey,
      },
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return NewsResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
