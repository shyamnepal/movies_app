import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/text.dart';
import 'package:movies_app/data/response/status.dart';
import 'package:movies_app/view_model/all_movies_views.dart';
import 'package:provider/provider.dart';

class AllMovies extends StatefulWidget {
  const AllMovies({Key? key}) : super(key: key);

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AllMoviesViews>(context,listen: false).fetchMoviesListApi();
    });


  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return 
      Scaffold(
        body: Consumer<AllMoviesViews>(
          builder: (context, value, child) {
            switch(value.moviesList.status){
              case Status.LOADING:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              case  Status.ERROR:
                return Center(
                  child: Text('${value.moviesList.message.toString()}'),
                );
              case Status.COMPLETED:
                  return SafeArea(

                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(text: 'All Movies', size: 18),
                          SizedBox(
                            height: 10,
                          ),

                          Flexible(
                            child: GridView.builder(
                                itemCount: value.moviesList.data.results.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,childAspectRatio: 0.7,

                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10
                                ),
                                itemBuilder: (context, index) {
                                  return  Container(

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

                                          Image.network('http://image.tmdb.org/t/p/w500/${value.moviesList.data.results![index]!.backdropPath}',
                                            height:  height *.23,
                                            width: width *.5,
                                            fit: BoxFit.cover,

                                          ),
                                          CustomText(text: value.moviesList.data.results![index].originalTitle.toString(), size:  height*.02,bold: FontWeight.bold,),

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
                                                CustomText(text: value.moviesList.data.results![index].voteAverage.toString(), size: width *.04)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                    ),
                                  );
                                }
                            ),
                          )
                        ],
                      ),
                    ),
                  );
            }
            return Container();

          },
        )

      );
  }
}
