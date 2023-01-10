import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../repository/all_movies_repository.dart';

class AllMoviesViews extends ChangeNotifier{
  final _myRepo =AllMovesRepository();
  ApiResponse<dynamic> moviesList=ApiResponse.loading();
  setMoviesList(ApiResponse<dynamic>  response){
    moviesList=response;
    notifyListeners();

  }
  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());
    _myRepo.Movies().then((value) {
      //print("the value is $value");

      setMoviesList(ApiResponse.completed(value));


    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

}