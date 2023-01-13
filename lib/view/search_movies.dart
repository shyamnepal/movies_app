import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/text.dart';
import 'package:movies_app/res/components/color.dart';
import 'package:movies_app/view_model/search_movies_view.dart';
import 'package:provider/provider.dart';

import '../custom_widget/search..dart';
import '../data/response/status.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({Key? key}) : super(key: key);

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {

  TextEditingController searchText =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final val=Provider.of<SearchMoviesViews>(context,listen: false);
   val.fetchSearchMoviesList();
    final height=MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
      body: Consumer<SearchMoviesViews>(

        builder: (BuildContext context, value, Widget? child) {
        switch(value.moviesSearchList.status){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator(),);
          case Status.ERROR:
            return Center(child: Text(value.moviesSearchList.message.toString(),style:
              TextStyle(color: Colors.white),),

            );

          case Status.COMPLETED:
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(

                      children: [

                        Platform.isIOS ?  Icon(Icons.arrow_back_ios,color: HexColor.whiteColor,)
                            : Icon(Icons.arrow_back,color: HexColor.whiteColor,),

                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: HexColor.dividerColor,
                            borderRadius: BorderRadius.circular(12),
                            // boxShadow: [
                            //   BoxShadow(
                            //     spreadRadius: 1.2,
                            //
                            //   )
                            // ],
                          ),
                          child: TextFormField(
                            controller: searchText,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                prefixIcon: Icon(Icons.search),
                                labelText: 'Search',
                                labelStyle: TextStyle(color: Colors.white)

                            ),


                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(text: 'Results', size: 18, color: HexColor.whiteColor),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: height *.03,
                    ),


                    Flexible(

                      child: ListView.builder(


                          scrollDirection: Axis.vertical,
                          itemCount: value.moviesSearchList.data!.results!.length,
                          itemBuilder: (context, item){


                            return  Padding(
                              padding:  EdgeInsets.only(top: height *.03),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: CustomText(text: '${value.moviesSearchList.data!.results![item].title}', size: 18, bold: FontWeight.bold,),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: (value.moviesSearchList.data!.results![item]!.posterPath ==null) ?
                                      Icon(Icons.image_not_supported) :
                                      (value.moviesSearchList.data!.results![item].backdropPath ==null) ?
                                          Image.network('http://image.tmdb.org/t/p/w500/${value.moviesSearchList.data!.results![item]!.posterPath}')


                                       : Image.network('http://image.tmdb.org/t/p/w500/${value.moviesSearchList.data!.results![item]!.backdropPath}'),

                                    ),
                                    trailing: InkWell(
                                        onTap: (){
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> MoviesGenre(
                                          //     id: value.moviesGenreList.data[0].genres[item].id,
                                          //     genre: '${value.moviesGenreList.data[0].genres[item].name}')
                                          // ),
                                          // );

                                        },
                                        child: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,)),
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  const Divider(
                                    color: HexColor.dividerColor,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),

              ),
            );
        }


        return Container();


        },

      ),
      );
  }
}
