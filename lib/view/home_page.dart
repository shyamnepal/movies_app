
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/custom_navbar.dart';
import 'package:movies_app/custom_widget/search..dart';
import 'package:movies_app/custom_widget/text.dart';
import 'package:movies_app/data/response/status.dart';
import 'package:movies_app/res/components/color.dart';
import 'package:movies_app/utils/routes_names.dart';
import 'package:movies_app/view/all_movies.dart';
import 'package:movies_app/view/new_releass_detials.dart';
import 'package:movies_app/view/search_movies.dart';
import 'package:movies_app/view/upcomming_movies_detials.dart';
import 'package:movies_app/view_model/movies_list_view.dart';
import 'package:provider/provider.dart';




class HomePage extends StatefulWidget{
  State<StatefulWidget> createState(){
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MoviesListView>(context,listen: false).fetchMoviesListApi();
    });
  }
  @override
  Widget build(BuildContext context){




    final height=MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(height.toString());
    print(width.toString());

    return Scaffold(


      body: Consumer<MoviesListView>(
        builder: (context, value, child) {
         // print("the value is "+value.moviesList.data);
          switch(value.moviesList.status){

            case Status.LOADING:

              return Center(child: CircularProgressIndicator(),);
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()),);

            case Status.COMPLETED:
              return SafeArea(
                child: Padding(
                  padding:  EdgeInsets.only(left:  width *.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: height *.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Upcomming Movies',
                              size: height*.03,
                              bold: FontWeight.bold,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: width *.03),
                              child: InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, RoutesName.searchMovies);
                                  },
                                  child: Search(searchIcon: Icons.search, iconSize: height*.03,)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height *.01,
                      ),
                      Container(
                        height: height *.28,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.moviesList.data[1]!.results!.length,
                            itemBuilder: (context, index){
                              return Stack(

                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(right: width *.03),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, RoutesName.upcommingMovies,arguments: {'moviesResult': value.moviesList.data[1],'index': index});

                                      },
                                      child: ClipRRect(

                                        borderRadius: BorderRadius.circular(width *.04),
                                        child:  value.moviesList.data[1]!.results![index]!.backdropPath !=null ? Image.network('http://image.tmdb.org/t/p/w500/${value.moviesList.data[1]!.results![index]!.backdropPath}',
                                          height: height *.4,
                                          width: width * .7,
                                          fit: BoxFit.cover,

                                        ): Icon(Icons.image_not_supported,size: height *.04)

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: height *.06, left: width *.15),
                                    child:  Center(
                                      child: Container(
                                        width: 200,

                                        child: Text(value.moviesList.data[1]!.results![index].originalTitle.toString(),style: TextStyle(color: HexColor.whiteColor,
                                        fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                        ),
                      ),
                      SizedBox(
                        height: height *.01,
                      ),

                      Padding(
                        padding:  EdgeInsets.only(right: width *.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: 'New releases', size: height*.03, bold: FontWeight.bold,),
                            InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, RoutesName.showAllMovies);
                                },
                                child: CustomText(text: 'see all', size: height *.023,color: HexColor.pinkTextColor,))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height *.01,
                      ),

                      Container(
                        height: height *.43,

                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.moviesList.data[0]!.results!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding:  EdgeInsets.only(right: width *.03),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, RoutesName.newReleaseMovies,arguments: {'moviesResult': value.moviesList.data[0],'index': index});
                                  },
                                  child: Container(
                                    width: width *.5,
                                    height: height *.43,
                                    decoration: BoxDecoration(
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
                                          Image.network('http://image.tmdb.org/t/p/w500/${value.moviesList.data[0]!.results![index]!.backdropPath}',
                                            height:  height *.3,
                                            width: width *.5,
                                            fit: BoxFit.cover,

                                          ),
                                          CustomText(text: value.moviesList.data[0]!.results![index].originalTitle.toString(), size:  height*.02,bold: FontWeight.bold,),

                                          CustomText(text: value.moviesList.data[0]!.results![index].mediaType.toString(), size: width *.05),
                                          SizedBox(
                                             height: height*.01,
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: width *.001),
                                            child: Row(
                                              children:  [
                                                Icon(Icons.star, color: Colors.yellow,size: height *.04,),
                                                SizedBox(
                                                  width: width *.01,
                                                ),
                                                CustomText(text: value.moviesList.data[0]!.results![index].voteAverage.toString(), size: width *.04)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                    ),
                                  ),
                                ),

                              );
                            }
                        ),
                      ),


                    ],
                  ),
                ),
              );
          }
          return Container();

        },
      ),
      bottomNavigationBar: CustomNavbar(),
    );



  }
}