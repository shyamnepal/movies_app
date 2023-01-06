import 'package:flutter/material.dart';
import 'package:movies_app/custom_widget/text.dart';

import '../custom_widget/search..dart';
import '../res/components/color.dart';
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
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
                  itemCount: 8,
                  itemBuilder: (context, item){
                return  Padding(
                  padding:  EdgeInsets.only(top: height *.03),
                  child: Column(
                    children: [
                      ListTile(
                        title: CustomText(text: 'Action', size: 18, bold: FontWeight.bold,),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('assets/images/images.jpeg'),

                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,),
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
}
