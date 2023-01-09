import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/list_movies_genre.dart';
import '../res/components/app_url.dart';

class GenreRepository{
  BaseApiServices _apiServices=NetworApiServices();
  Future<dynamic> listMoviesGenre(int moviesId) async{
    try{
      int id=moviesId;

      dynamic response= await _apiServices.getGetApiResponse(AppUrl.listmoves(id));
      return response= ListMoviesGenre.fromJson(response);

    }catch(e){
      throw e;
    }

  }
}