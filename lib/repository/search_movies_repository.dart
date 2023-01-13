import 'package:movies_app/model/search_movies_model.dart';
import 'package:movies_app/view/search_movies.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/list_movies_genre.dart';
import '../res/components/app_url.dart';

class SearchMoviesRepository{
  BaseApiServices _apiServices=NetworApiServices();
  Future<SearchMoviesModel> SearchMoviesList(String title) async{
    try{


      dynamic response= await _apiServices.getGetApiResponse(AppUrl.searchMoviesList(title));
      return response= SearchMoviesModel.fromJson(response);

    }catch(e){
      throw e;
    }

  }
}