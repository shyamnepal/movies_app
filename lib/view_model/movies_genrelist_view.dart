import 'package:flutter/cupertino.dart';
import 'package:movies_app/repository/genre_list_repository.dart';

import '../data/response/api_response.dart';


class MoviesGenreListView extends ChangeNotifier{
   int id=16;
 final  _genraList=GenreListRepository();
 ApiResponse<dynamic> moviesGenreList=ApiResponse.loading();
 setMoviesList(ApiResponse<dynamic>  response){
   moviesGenreList=response;
   notifyListeners();

 }

 Future<void> fetchMoviesListApi() async{

   setMoviesList(ApiResponse.loading());
   _genraList.listMoviesGenre(id!).then((value) {
     //print("the value is $value");
     List<dynamic> allMoviesGenre=[
       value[0],
       value[1],
     ];
     setMoviesList(ApiResponse.completed(allMoviesGenre));


   }).onError((error, stackTrace) {
     setMoviesList(ApiResponse.error(error.toString()));
   });
 }
}