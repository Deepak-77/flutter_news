import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project_2/models/news.dart';
import '../services/news_services.dart';

final newsProvider = FutureProvider.family((ref,String query) => NewsService.getNews(query: query));

final searchProvider = StateNotifierProvider<SearchNewsProvider, List<News>>((ref) => SearchNewsProvider());

class SearchNewsProvider extends StateNotifier<List<News>>{
  SearchNewsProvider() : super([]){

    getNews();
  }


  Future<void>  getNews() async{
    final response = await NewsService.getDefaultNews();
    state = response;
  }


  Future<void>  searchNews(String query) async{
    state = [];
    final response = await NewsService.getNews(query: query);
    state = response;

  }


}


final proProvider = ChangeNotifierProvider((ref) => ProgressProvider());
class ProgressProvider extends ChangeNotifier{

  double value = 0.0;

  void changeValue(double val){
    value = val;
    notifyListeners();
  }

}