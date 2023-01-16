import 'package:flutter/material.dart';
import 'package:movies_app/view_model/favourite_model.dart';
import 'package:provider/provider.dart';

import '../custom_widget/search..dart';
import '../custom_widget/text.dart';
import '../data/response/status.dart';
import '../res/components/color.dart';
import '../view_model/movies_list_view.dart';

class ShowFavouriteMovies extends StatefulWidget {
  const ShowFavouriteMovies({Key? key}) : super(key: key);

  @override
  State<ShowFavouriteMovies> createState() => _ShowFavouriteMoviesState();

}

class _ShowFavouriteMoviesState extends State<ShowFavouriteMovies> {
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MoviesListView>(context,listen: false).fetchMoviesListApi();
    });
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    final len=Provider.of<FavouriteModel>(context);
    return Scaffold(
      body: Consumer<MoviesListView>(
          builder: (context, value, child)  {
            switch(value.moviesList.status){
              case Status.LOADING:

                return Center(child: CircularProgressIndicator(),);
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()), );

              case Status.COMPLETED:
                return Padding(
                  padding:  EdgeInsets.only(left:  width *.04,right: width *.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height *.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'List of favourite movies',
                            size: 18,
                            bold: FontWeight.bold,
                          ),
                          Search(searchIcon: Icons.search, iconSize: 18,),
                        ],
                      ),

                      Flexible(

                        child: ListView.builder(


                            scrollDirection: Axis.vertical,
                            itemCount: len.selectedItem.length,
                            itemBuilder: (context, item){

                              return  Padding(
                                padding:  EdgeInsets.only(top: height *.03),
                                child: Column(
                                  children: [
                                    (len.selectedItem[item]['upcomming'] !=null) ?
                                    ListTile(
                                      title:  CustomText(text: '${value.moviesList.data[1].results[len.selectedItem[item]['upcomming']].title}', size: 18, bold: FontWeight.bold,),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network('http://image.tmdb.org/t/p/w500/${value.moviesList.data[1].results[len.selectedItem[item]['upcomming']].backdropPath}'),

                                      ),
                                      trailing: InkWell(
                                          onTap: (){
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> MoviesGenre(
                                            //     id: value.moviesGenreList.data[0].genres[item].id,
                                            //     genre: '${value.moviesGenreList.data[0].genres[item].name}')
                                            // ),
                                            // );

                                          },
                                          child: const Icon(Icons.favorite,color: Colors.white,size: 16,)),
                                      contentPadding: EdgeInsets.zero,
                                    )
                                    :  ListTile(
                                      title:  CustomText(text: '${value.moviesList.data[0].results[len.selectedItem[item]['newrelease']].title}', size: 18, bold: FontWeight.bold,),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network('http://image.tmdb.org/t/p/w500/${value.moviesList.data[0].results[len.selectedItem[item]['newrelease']].backdropPath}'),

                                      ),
                                      trailing: InkWell(
                                          onTap: (){
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> MoviesGenre(
                                            //     id: value.moviesGenreList.data[0].genres[item].id,
                                            //     genre: '${value.moviesGenreList.data[0].genres[item].name}')
                                            // ),
                                            // );

                                          },
                                          child: const Icon(Icons.favorite,color: Colors.white,size: 16,)),
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
                );

            }
            return Container();

          }),
    );
  }
}
