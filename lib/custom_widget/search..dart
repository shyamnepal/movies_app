import 'package:flutter/material.dart';
import 'package:movies_app/res/components/color.dart';
class Search extends StatelessWidget {
 final IconData searchIcon;
 final Color searchColor;
 final double iconSize;

   const Search({Key? key, required this.searchIcon, this.searchColor=HexColor.whiteColor, required this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.height;

    return Container(
      height: height *.06,
      width:  width * .1,
      decoration: const BoxDecoration(
        color: HexColor.search,
        shape: BoxShape.circle
      ),
      child: Icon(searchIcon,color: searchColor,size: iconSize,),
    );
  }
}
