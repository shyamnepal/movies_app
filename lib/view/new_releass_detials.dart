import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/movies_details_page.dart';
import 'package:video_player/video_player.dart';



class NewReleaseDetails extends StatefulWidget {

  const NewReleaseDetails({Key? key}) : super(key: key);

  @override
  State<NewReleaseDetails> createState() => _NewReleaseDetailsState();
}

class _NewReleaseDetailsState extends State<NewReleaseDetails> {


  @override
  Widget build(BuildContext context) {
    final routeArg=ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  final  value=routeArg['moviesResult'];
  final  index=routeArg['index'] as int;

    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;



    return MoviesDetailsCustomPages(backdropPath: value.results![index]!.backdropPath, description: value.description, createdBy: value.createdBy!.name,id: {'newrelease':index});
  }
}
