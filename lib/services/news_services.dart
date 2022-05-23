import 'package:dio/dio.dart';

import '../api.dart';
import '../models/news.dart';



class NewsService{

  static Future<List<News>> getNews({required String query}) async{
    final dio = Dio();
    try{
      final response = await dio.get(Api.baseUrl, queryParameters: {
        'q': query,
        'lang': 'en'
      }, options: Options(
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key': '158504c85cmsha81af2eeccd0865p1ec204jsn4f931af67096'
          }
      ));

      if(response.data['status'] == 'No matches for your search.'){
        return [News(
            title: 'No matches for your search.',
            author: '',
            media: '',
            link: '',
            published_date: '', summary:'')];
      }else{
        final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
        return data;
      }

    }on DioError catch (e){
      print(e.message);
      throw Exception(e.message);
    }

  }


  static Future<List<News>> getDefaultNews() async{
    final dio = Dio();
    try{
      await Future.delayed(Duration(seconds: 3));
      final response = await dio.get(Api.baseUrl, queryParameters: {
        'q': 'nasa',
        'lang': 'en'
      }, options: Options(
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key': '158504c85cmsha81af2eeccd0865p1ec204jsn4f931af67096'
          }
      ));

      final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
      return data;
    }on DioError catch (e){
      print(e.message);
      throw Exception(e.message);

    }

  }
  }