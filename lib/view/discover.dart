import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/text.dart';
import 'package:movies_app/view/movies_genre.dart';
import 'package:movies_app/view_model/movies_genrelist_view.dart';
import 'package:provider/provider.dart';

import '../custom_widget/search..dart';
import '../data/response/status.dart';
import '../res/components/color.dart';
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  MoviesGenreListView allMoviesGenre=MoviesGenreListView();
  @override
  void initState() {
    allMoviesGenre.fetchMoviesListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      body:ChangeNotifierProvider<MoviesGenreListView>(
        create: (BuildContext context) => allMoviesGenre,
        child: Consumer<MoviesGenreListView>(
          builder: (context, value, child)  {
            switch(value.moviesGenreList.status){
            case Status.LOADING:

            return Center(child: CircularProgressIndicator(),);
            case Status.ERROR:
            return Center(child: Text(value.moviesGenreList.message.toString()), );

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
                          text: 'Discover',
                          size: 18,
                          bold: FontWeight.bold,
                        ),
                        Search(searchIcon: Icons.search, iconSize: 18,),
                      ],
                    ),
                    SizedBox(
                      height: height*.05,
                    ),
                    Flexible(

                      child: ListView.builder(


                          scrollDirection: Axis.vertical,
                          itemCount: value.moviesGenreList.data[0].genres.length,
                          itemBuilder: (context, item){

                            return  Padding(
                              padding:  EdgeInsets.only(top: height *.03),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: CustomText(text: '${value.moviesGenreList.data[0].genres[item].name}', size: 18, bold: FontWeight.bold,),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network('http://image.tmdb.org/t/p/w500/${value.moviesGenreList.data[1].results[item].backdropPath}'),

                                    ),
                                    trailing: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MoviesGenre(
                                            id: value.moviesGenreList.data[0].genres[item].id,
                                            genre: '${value.moviesGenreList.data[0].genres[item].name}')
                                          ),
                                          );

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
              );

      }
      return Container();

          }),
        ),


    );
  }
}
