import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/text.dart';
import 'package:movies_app/res/components/color.dart';
import 'package:movies_app/view/discover.dart';
class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    return Container(
      height: height*.08,
      decoration: const BoxDecoration(
        color: HexColor.navigationBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){},
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.white,
                ),
                CustomText(text: 'Home', size: 16)
              ],
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DiscoverPage()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.category,
                  size: 20,
                  color: Colors.white,
                ),
                CustomText(text: 'Discover', size: 16)
              ],
            ),
          ),

          InkWell(
            onTap: (){},
            child: Column(
              children: [
                Icon(
                  Icons.favorite,
                  size: 20,
                  color: Colors.white,
                ),
                CustomText(text: 'favorite', size: 16)
              ],
            ),
          ),
          InkWell(
            onTap: (){},
            child: Column(
              children: [
                Icon(
                  Icons.download,
                  size: 20,
                  color: Colors.white,
                ),
                CustomText(text: 'Download', size: 16)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
