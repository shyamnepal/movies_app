import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/response/api_response.dart';
import 'package:movies_app/model/movies_list.dart';
import 'package:movies_app/repository/movies_list_repository.dart';

class MoviesListView extends ChangeNotifier{
  final _myRepo =MoviesListRepository();
  ApiResponse<dynamic> moviesList=ApiResponse.loading();
  setMoviesList(ApiResponse<dynamic>  response){
    moviesList=response;
    notifyListeners();

  }
  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());
    _myRepo.listMovies().then((value) {
      //print("the value is $value");
      List<dynamic> allMovies=[
        value[0],
        value[1],
      ];
      setMoviesList(ApiResponse.completed(allMovies));


    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));

    });

  }

}