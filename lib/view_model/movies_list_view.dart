import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/response/api_response.dart';
import 'package:movies_app/model/movies_list.dart';
import 'package:movies_app/repository/movies_list_repository.dart';

class MoviesListView extends ChangeNotifier{
  final _myRepo =MoviesListRepository();
  ApiResponse<MoviesList> moviesList=ApiResponse.loading();
  setMoviesList(ApiResponse<MoviesList> response){

    moviesList=response;
    notifyListeners();
  }
  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());
    _myRepo.listMovies().then((value) {
      print("the value is $value");
      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

}