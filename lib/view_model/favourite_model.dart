import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FavouriteModel extends ChangeNotifier{

  List <dynamic> _selectedItem=[];
  bool _temp=false;

  List<dynamic>  get selectedItem => _selectedItem;
  bool get temp=> _temp;
  void addItem(value){
    _selectedItem.add(value);
    notifyListeners();
  }
  void removeItems(id){
    _selectedItem.removeWhere((element) => element.keys.first == id.keys.first);

    notifyListeners();
  }


}