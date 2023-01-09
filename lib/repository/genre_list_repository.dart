import 'package:movies_app/model/genre_list.dart';
import 'package:movies_app/model/list_movies_genre.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../res/components/app_url.dart';

class GenreListRepository{
  BaseApiServices _apiServices=NetworApiServices();
  Future<dynamic> listMoviesGenre(int moviesId) async{
    try{
      int id=moviesId;
      dynamic response= await _apiServices.getGetApiResponse(AppUrl.genreList);
      dynamic response1= await _apiServices.getGetApiResponse(AppUrl.listmoves(id));
      return response=[
         GenreList.fromJson(response),
         ListMoviesGenre.fromJson(response1),
      ];
    }catch(e){
      throw e;
    }

  }
}