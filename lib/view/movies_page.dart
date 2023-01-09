import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/movies_button.dart';
import 'package:movies_app/custom_widget/text.dart';
import 'package:movies_app/model/upcomming_movies.dart';
import 'package:movies_app/res/components/color.dart';
import 'package:movies_app/view_model/movies_list_view.dart';
import 'package:video_player/video_player.dart';

import '../model/movies_list.dart';

class MoviesPage extends StatefulWidget {
  final dynamic moviesResult;
  final int index;
  const MoviesPage({Key? key, required this.moviesResult, required this.index}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

 VideoPlayerController? _controller;
 Future<void>? _initializeVideoPlayerFuture;

@override
  void initState() {
    _controller=VideoPlayerController.network(
        'https://www.themoviedb.org/movie/370172-no-time-to-die#play=EGQpMaWiixk');
        _initializeVideoPlayerFuture =_controller!.initialize();
        _controller!.setLooping(true);
        _controller!.setVolume(1.0);
    super.initState();
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  var value=widget.moviesResult;
  var index=widget.index;
  print(index);
    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [

          Opacity(
            opacity: 0.7,
            child: Image.network(
              'http://image.tmdb.org/t/p/w500/${value.results![index]!.backdropPath}',
              height: height *.31,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: height*.01, horizontal: width *.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
            },
                            child: Icon(Icons.arrow_back,
                            color: HexColor.whiteColor,
                              size: width *.07,
                            ),
                        ),


                        InkWell(
                          onTap: (){

                          },
                          child: Icon(Icons.favorite,
                            color:HexColor.whiteColor,
                            size:  width *.07,
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: height *.03,

                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: height *.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                            builder: (context,snapshot){
                              if (snapshot.connectionState==ConnectionState.done){
                                return Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width *.05),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.8),
                                        spreadRadius: 3,
                                        blurRadius: 8,
                                      ),

                                    ],

                                  ),


                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(width *.05),
                                      child: Image.network('http://image.tmdb.org/t/p/w500/${value.results![index]!.backdropPath}',
                                        height: height*.4,
                                        width: width *.45,
                                        fit: BoxFit.cover,
                                      )),


                                );
                              }else{
                                return CircularProgressIndicator();
                              }
                            }
                        ),
                       Container(
        margin: EdgeInsets.only(right: width *.07),
        height: height *.10,
        width: width *.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 8,
              )
            ]
        ),
        child: InkWell(
          onTap: (){
            setState(() {
              if(_controller!.value.isPlaying){
                _controller!.pause();
              }else{
                _controller!.play();
              }
            });
          },
          child: Icon(_controller!.value.isPlaying ?Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: height *.09,
          ),
        ),
      ),


                      ],
                    ),
                  ),

                  SizedBox(
                    height: height *.04,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width *.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MoviesPageButtons(icon: Icons.add_outlined),
                        MoviesPageButtons(icon: Icons.favorite_outline),
                        MoviesPageButtons(icon: Icons.download_outlined),
                        MoviesPageButtons(icon: Icons.share_outlined),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width * .02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Summaries', size: width *.05,bold: FontWeight.bold,),
                        SizedBox(
                          height: height *.03,

                        ),
                        // CustomText(
                        //     text:  value.description.toString()  ,
                        //     size: width*.04),


                        SizedBox(
                          height: height *.01,
                        ),
                       // CustomText(text: 'Director: ${value.createdBy!.name}', size: width*.04,color: HexColor.whiteColor24,),


                        SizedBox(
                          height: height *.01,
                        ),

                        CustomText(text: 'Star: Juila Waniawa-nakianiez, Mechal Lipa, Wiktoria Gasiewka ', size: width *.04,color: HexColor.whiteColor24,),



                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )

    );
  }
}
