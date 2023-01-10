import 'package:movies_app/data/network/base_api_services.dart';
import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/model/movies_list.dart';
import 'package:movies_app/res/components/app_url.dart';




class AllMovesRepository{
  BaseApiServices _apiServices= NetworApiServices();
  Future<dynamic> Movies() async{
    try{
      dynamic response=await _apiServices.getGetApiResponse(AppUrl.listMovies);
      return response=MoviesList.fromJson(response);

    }catch(e){
      throw e;
    }

  }
}