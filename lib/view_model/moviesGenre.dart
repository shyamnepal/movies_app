import 'package:flutter/cupertino.dart';
import 'package:movies_app/repository/Genre_repository.dart';

import '../data/response/api_response.dart';

class MoviesGenreView extends ChangeNotifier{
  var id;

  final  _genraList=GenreRepository();

  ApiResponse<dynamic> moviesGenreList=ApiResponse.loading();
  setMoviesList(ApiResponse<dynamic>  response){
    moviesGenreList=response;
    notifyListeners();

  }
  Future<void> fetchMoviesListApi() async{

    setMoviesList(ApiResponse.loading());
    _genraList.listMoviesGenre(id).then((value) {


      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

}

