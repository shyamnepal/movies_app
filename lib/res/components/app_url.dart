import 'package:movies_app/res/components/api_key.dart';

class AppUrl{

  static  var baseUrl='https://api.themoviedb.org';
  static var listMovies= baseUrl+'/4/list/1?page=1&api_key=${ApiKey.apiKey}';
  static var upCommingMovies=baseUrl+'/3/movie/upcoming?api_key=${ApiKey.apiKey}&language=en-US&page=1';
  static var genreList = baseUrl + '/3/genre/movie/list?api_key=${ApiKey.apiKey}&language=en-US';
  static var listMoviesGenre;
  static listmoves(int id){

     return  listMoviesGenre=baseUrl + '/3/discover/movie?api_key=${ApiKey.apiKey}&with_genres=${id}';
  }
  static var searchMovies;
  static searchMoviesList(String title){
    return searchMovies=baseUrl + '/3/search/movie?api_key=${ApiKey.apiKey}&query=${title}';
  }



}