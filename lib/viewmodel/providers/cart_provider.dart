import 'package:flutter/cupertino.dart';
import 'package:jyothi_test/data/hive_storage.dart';

import '../../model/product_hive_model.dart';
import '../../model/products_model.dart';

class CartProvider extends ChangeNotifier{
  List<ProductHiveModel>? _getProducts;
  List<ProductHiveModel>? get getProducts=>_getProducts;

  getCarts(){
    _getProducts = HiveOperations.getDatas();
    print("_getCarted Products $_getProducts");
  }

  deleteFromCart(int id) async {
    await HiveOperations.removeFromCart(id).then((_){
      notifyListeners();
    });

  }

  addToCart(Products model){
    final pro =
    ProductHiveModel.fromJson(model.toJson());
    //description: ,stock: ,price: ,weight: ,availabilityStatus: ,brand: ,category: ,dimensions: ,discountPercentage: ,id: ,images: ,meta: ,minimumOrderQuantity:);
    //context.read<HomeProvider>().addToCart(pro);
    HiveOperations.addToCart(pro);
    notifyListeners();
  }


}