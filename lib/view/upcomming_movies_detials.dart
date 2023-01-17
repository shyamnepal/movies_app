import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/movies_details_page.dart';
import 'package:movies_app/model/upcomming_movies.dart';
import 'package:video_player/video_player.dart';



class UpcommingMoviesDetials extends StatefulWidget {

  const UpcommingMoviesDetials({Key? key}) : super(key: key);

  @override
  State<UpcommingMoviesDetials> createState() => _UpcommingMoviesDetialsState();
}

class _UpcommingMoviesDetialsState extends State<UpcommingMoviesDetials> {


  @override
  Widget build(BuildContext context) {
    final  routeArg=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final value=routeArg['moviesResult'];
    final  index=routeArg['index'];

    print(index);
    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;

    print("upcomming id is "+value.results[index].id.toString());


    return MoviesDetailsCustomPages(backdropPath: value.results![index]!.backdropPath, description: value.results[index].overview,id: {"upcomming":index});
  }
}
