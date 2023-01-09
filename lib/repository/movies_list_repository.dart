import 'package:movies_app/data/network/base_api_services.dart';
import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/model/movies_list.dart';
import 'package:movies_app/model/upcomming_movies.dart';
import 'package:movies_app/res/components/app_url.dart';

class MoviesListRepository{
  BaseApiServices _apiServices=NetworApiServices();
  Future<dynamic> listMovies() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppUrl.listMovies);
      dynamic response1= await _apiServices.getGetApiResponse(AppUrl.upCommingMovies);
      return response=[
    MoviesList.fromJson(response),
        UpcommingMovies.fromJson(response1)
        ];
    }catch(e){
      throw e;
    }

  }

}