import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/text.dart';
import 'package:movies_app/view_model/favourite_model.dart';
import 'package:provider/provider.dart';

import '../res/components/color.dart';
import 'movies_button.dart';

class MoviesDetailsCustomPages extends StatefulWidget {
  const MoviesDetailsCustomPages({Key? key,required this.backdropPath, required this.description,this.createdBy='shyam',required this.id} ) : super(key: key);
  final String backdropPath;
  final String description;
  final String createdBy;
  final  Map  id;


  @override
  State<MoviesDetailsCustomPages> createState() => _MoviesDetailsCustomPagesState();
}

class _MoviesDetailsCustomPagesState extends State<MoviesDetailsCustomPages> {



  @override
  Widget build(BuildContext context) {

    final id=widget.id;

    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;





    print("rebuild methods callas");
    print("$id");
     return Scaffold(
        body: Stack(
          children: [

            Opacity(
              opacity: 0.7,
              child: Image.network(
                'http://image.tmdb.org/t/p/w500/${widget.backdropPath}',
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


                          Consumer<FavouriteModel>(


                   builder: (BuildContext context, value, Widget? child) {
                    

                        return GestureDetector(
                                onTap: (){

                                  if(value.selectedItem.any((element) => DeepCollectionEquality().equals(element, id))){

                                    value.removeItems(id);
                                    print('the vlue is ture ${value.selectedItem}');
                                  }else{

                                     value.addItem(id);
                                     print('the vlue is false ${value.selectedItem}');


                                  }

                                },
                                child:Icon (
                                  (    value.selectedItem.any((element) => DeepCollectionEquality().equals(element, id))
                                  ) ?  Icons.favorite
                                      : Icons.favorite_outline,

                                  color:HexColor.whiteColor,
                                  size:  width *.07,
                                ),

                              );

                            },

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


                         
                                   Container(

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
                                        child: Image.network('http://image.tmdb.org/t/p/w500/${widget.backdropPath}',
                                          height: height*.4,
                                          width: width *.45,
                                          fit: BoxFit.cover,
                                        )),


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
                               
                              },
                              child: Icon(Icons.play_arrow,
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
                          CustomText(
                              text: widget.description.toString()  ,
                              size: width*.04),


                          SizedBox(
                            height: height *.01,
                          ),
                          CustomText(text: 'Director: ${widget.createdBy}', size: width*.04,color: HexColor.whiteColor24,),


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
