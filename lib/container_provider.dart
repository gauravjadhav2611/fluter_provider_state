import 'package:flutter/material.dart';

class ContainerProvider extends ChangeNotifier{
  double containerHeight = 100.0;

  ContainerProvider({required this.containerHeight});

  increaseHeight() {
    if(containerHeight !<400) {
      containerHeight += 10.0;
    }
    notifyListeners();
  }

  decreaseHeight(){
    if(containerHeight !> 10.0) {
      containerHeight -= 10.0;
    }
    notifyListeners();
  }

  resetHeight(){
    containerHeight = 100.0;
    notifyListeners();
  }
}