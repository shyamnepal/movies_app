import 'package:flutter/material.dart';
class MoviesPageButtons extends StatelessWidget {
  IconData icon;
  double size;
  Color color;
   MoviesPageButtons({Key? key,required this.icon, this.size=20, this.color=Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF292B37),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF292B37).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
              ),

            ],

          ),
          child: Icon(icon, color: Colors.white, size: size,),
        ),

      ],
    );
  }
}
