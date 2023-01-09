import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/view_model/moviesGenre.dart';
import 'package:movies_app/view_model/movies_list_view.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class MoviesGenre extends StatefulWidget {
 final int id;
 final String genre;

 MoviesGenre({required this.id,required this.genre});

  @override
  State<MoviesGenre> createState() => _MoviesGenreState();

}

class _MoviesGenreState extends State<MoviesGenre> {
  MoviesGenreView _moviesGenreViews=MoviesGenreView();
  @override
  void initState() {
    _moviesGenreViews.id=widget.id;
    _moviesGenreViews.fetchMoviesListApi();

    super.initState();
  }
 void idexecute() async{
     _moviesGenreViews.id= await widget.id;
 }



  @override
  Widget build(BuildContext context) {


    int id =widget.id;
    print('The id is ${id}');
    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('List of ${widget.genre} Movies'),
      ),
      body: ChangeNotifierProvider<MoviesGenreView>(
        create: (BuildContext context) => _moviesGenreViews,
        child: Consumer<MoviesGenreView>(
          builder: (context, value, child) {
            // print("the value is "+value.moviesGenreList.data.results[0].backdropPath);
            switch(value.moviesGenreList.status){

              case Status.LOADING:
                return Center(child: CircularProgressIndicator(),);
              case Status.ERROR:
                return Center(child: Text(value.moviesGenreList.message.toString()),);

              case Status.COMPLETED:
                return GridView.builder(
                  itemCount: value.moviesGenreList.data.results.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(width *.04),
                          child: Image.network('http://image.tmdb.org/t/p/w500/${value.moviesGenreList.data.results![index]!.backdropPath}',
                            height: height *.4,
                            width: width * .7,
                            fit: BoxFit.cover,

                          ),

                        ),
                      );
                    });

            }
            return Container(

              color: Colors.red,
            );

          },
        ),
      ),

    );
  }
}
