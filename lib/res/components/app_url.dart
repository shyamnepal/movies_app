import 'package:movies_app/res/components/api_key.dart';

class AppUrl{

  static  var baseUrl='https://api.themoviedb.org';
  static var listMovies= baseUrl+'/4/list/1?page=1&api_key=${ApiKey.apiKey}';
}