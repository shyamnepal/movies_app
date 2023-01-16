import 'package:flutter/material.dart';
import 'package:movies_app/res/components/color.dart';
import 'package:movies_app/view/discover.dart';
import 'package:movies_app/view/home_page.dart';
import 'package:movies_app/view_model/all_movies_views.dart';
import 'package:movies_app/view_model/favourite_model.dart';
import 'package:movies_app/view_model/moviesGenre.dart';
import 'package:movies_app/view_model/movies_genrelist_view.dart';
import 'package:movies_app/view_model/movies_list_view.dart';
import 'package:movies_app/view_model/search_movies_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _selectedIndex=0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DiscoverPage(),


    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),

  ];


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (BuildContext context)=> SearchMoviesViews()),
      ChangeNotifierProvider(create: (BuildContext context)=> MoviesListView()),
      ChangeNotifierProvider(create: (_)=> AllMoviesViews()),
      ChangeNotifierProvider(create: (_)=> MoviesGenreListView()),
      ChangeNotifierProvider(create: (_)=> MoviesGenreView()),
      ChangeNotifierProvider(create: (_)=> FavouriteModel()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies application',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0F111F),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // Scaffold(
      //   bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.orange,
      //
      //
      //     items: const <BottomNavigationBarItem> [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //         backgroundColor: HexColor.navigationBarColor,
      //
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.dehaze),
      //         label: 'Discover',
      //         backgroundColor: HexColor.navigationBarColor,
      //
      //
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.download),
      //         label: 'Download',
      //         backgroundColor: HexColor.navigationBarColor,
      //
      //
      //
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.menu),
      //         label: 'More',
      //         backgroundColor: HexColor.navigationBarColor,
      //
      //
      //       ),
      //     ],
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: HexColor.selectedItem,
      //     onTap: _onItemTapped,
      //
      //   ),
      //   body: _widgetOptions.elementAt(_selectedIndex),
      // ),
    ),
    );
  }
}

