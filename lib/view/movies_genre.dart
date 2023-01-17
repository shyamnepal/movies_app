import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/view_model/moviesGenre.dart';
import 'package:movies_app/view_model/movies_list_view.dart';
import 'package:provider/provider.dart';

import '../custom_widget/text.dart';
import '../data/response/status.dart';

class MoviesGenre extends StatefulWidget {
 final int id;
 final String genre;

 MoviesGenre({required this.id,required this.genre});

  @override
  State<MoviesGenre> createState() => _MoviesGenreState();

}

class _MoviesGenreState extends State<MoviesGenre> {
  @override
  void initState() {
    Provider.of<MoviesGenreView>(context,listen: false).id=widget.id;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MoviesGenreView>(context,listen: false).fetchMoviesListApi();
    });
  }
 // void idexecute() async{
 //     _moviesGenreViews.id= await widget.id;
 // }



  @override
  Widget build(BuildContext context) {


    int id =widget.id;
    print('The id is ${id}');
    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(

      body: Consumer<MoviesGenreView>(
        builder: (context, value, child) {
          // print("the value is "+value.moviesGenreList.data.results[0].backdropPath);
          switch(value.moviesGenreList.status){

            case Status.LOADING:
              return Center(child: CircularProgressIndicator(),);
            case Status.ERROR:
              return Center(child: Text(value.moviesGenreList.message.toString()),);

            case Status.COMPLETED:
              return SafeArea(

                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: 10,
                      ),
                      CustomText(text: 'List of ${widget.genre} Movies', size: 18),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: value.moviesGenreList.data.results.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 10,
                                mainAxisSpacing: 10

                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                //padding: EdgeInsets.all(10),
                                width: width *.5,
                                height: height *.6,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Color(0xFF292B37),
                                    borderRadius: BorderRadius.circular(width *.04),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFF292B37).withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                      )
                                    ]
                                ),
                                child: ClipRRect(

                                  borderRadius: BorderRadius.circular(width *.04),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network('http://image.tmdb.org/t/p/w500/${value.moviesGenreList.data.results![index]!.backdropPath}',
                                        height:  height *.23,
                                        width: width *.5,
                                        fit: BoxFit.cover,

                                      ),
                                      CustomText(text: value.moviesGenreList.data.results![index].originalTitle.toString(), size:  height*.02,bold: FontWeight.bold,),

                                      //CustomText(text: value.moviesGenreList.data.results![index].mediaType.toString(), size: width *.05),
                                      SizedBox(
                                        height: height*.01,
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: width *.001),
                                        child: Row(
                                          children:  [
                                            Icon(Icons.star, color: Colors.yellow,size: height *.02,),
                                            SizedBox(
                                              width: width *.01,
                                            ),
                                            CustomText(text: value.moviesGenreList.data.results![index].voteAverage.toString(), size: width *.04)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );

          }
          return Container(

            color: Colors.red,
          );

        },
      ),

    );
  }
}
