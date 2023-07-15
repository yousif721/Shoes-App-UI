import 'package:flutter/material.dart';
import '../../../features/data/dummy_data.dart';
import '../../../features/data/models/shoes_model.dart';
import '../../widgets/snackbar.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(failedSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar());
    }
  }

  double calculateTotalPrice(){
    double totalPrice = 0.0;
    if(itemsOnBag.isEmpty){
      totalPrice = 0.0;
    }else{
      for(ShoeModel item in itemsOnBag){
        totalPrice = totalPrice + item.price*item.value;
      }
    }
    return totalPrice < 0 ? 0 : totalPrice;

  }
}