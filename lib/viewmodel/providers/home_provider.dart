import 'package:flutter/material.dart';
import 'package:jyothi_test/data/hive_storage.dart';
import 'package:jyothi_test/model/products_model.dart';
import 'package:jyothi_test/view/pages/cart_page/cart_page.dart';
import 'package:jyothi_test/view/pages/home_page/home_page.dart';
import 'package:jyothi_test/viewmodel/services/home_services.dart';

import '../../model/product_hive_model.dart';

class HomeProvider extends ChangeNotifier{
  HomeServices homeServices = HomeServices();

  static ValueNotifier<int> currentPageNotifier = ValueNotifier(0);

  HiveOperations hiveOperations = HiveOperations();

  ProductsModel? _productsModel;
  ProductsModel? get productsModel => _productsModel;
  getProducts() async {
    await homeServices.getAllProducts().then((data){
      final lastData = data.fold((fnL)=>fnL, (fnR)=>fnR);
      if(lastData is ProductsModel){
        _productsModel = lastData;
        notifyListeners();
      }else {
        print(lastData.toString());
      }
    });
  }


  currentIndex(int index){
    if(index==0){
      return HomePage();
    }else{
      return CartPage();
    }
  }

  updatePage(int index){
    currentPageNotifier.value = index;
    print("InDeX  $index");
  }

  addToCart(Products model){
    final pro =
    ProductHiveModel.fromJson(model.toJson());
    //description: ,stock: ,price: ,weight: ,availabilityStatus: ,brand: ,category: ,dimensions: ,discountPercentage: ,id: ,images: ,meta: ,minimumOrderQuantity:);
    //context.read<HomeProvider>().addToCart(pro);
    HiveOperations.addToCart(pro);
    notifyListeners();
  }

  deleteFromCart(int id){
    /*final pro =
    ProductHiveModel.fromJson(prod.toJson());
    HiveOperations.removeFromCart(pro.id!);*/
    HiveOperations.removeFromCart(id);
    notifyListeners();
  }

}