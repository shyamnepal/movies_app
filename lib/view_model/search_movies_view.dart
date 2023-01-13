import 'package:flutter/cupertino.dart';
import 'package:movies_app/model/search_movies_model.dart';
import 'package:movies_app/repository/Genre_repository.dart';
import 'package:movies_app/repository/search_movies_repository.dart';

import '../data/response/api_response.dart';

class SearchMoviesViews extends ChangeNotifier{
  var search="avatar";
  final  _searchList=SearchMoviesRepository();

  ApiResponse<SearchMoviesModel> moviesSearchList=ApiResponse.loading();
  setMoviesList(ApiResponse<SearchMoviesModel>  response){
    moviesSearchList=response;
    notifyListeners();

  }
  Future<void> fetchSearchMoviesList() async{

    setMoviesList(ApiResponse.loading());
    _searchList.SearchMoviesList(search).then((value) {
      // print("the value is ${value}");

      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

}

