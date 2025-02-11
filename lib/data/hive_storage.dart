import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../model/product_hive_model.dart';
import '../model/products_model.dart';


class HiveOperations {
  //static ValueNotifier<List<WatchListHive>> watchListNotifier = ValueNotifier([]);
  static addToCart(ProductHiveModel product) async {
    try{
      //final dbData = await Hive.openBox<WatchListHive>("comp");
      final dbData = Hive.box<ProductHiveModel>("cart");
      print(" Data $product");
      print("addToCart Data ${dbData.values}");
      final id = await dbData.add(product);
      final entry = dbData.get(id);
      product.id = id;
      if (entry != null) {
        await dbData.put(id, product);
      }
      print("dbData - $dbData");
    }catch (e){
      print("addToCart Exception ${e.toString()}");
    }

  }

  static List<ProductHiveModel> getDatas(){
    final dbData = Hive.box<ProductHiveModel>("cart");
    // watchListNotifier.value.clear();
    // watchListNotifier.value.addAll(dbData.values);
    // watchListNotifier.value = List.from(dbData.values);
    for(var q in dbData.values){
      print("Get Data ${q.title}");
    }
    return List.from(dbData.values);
  }

  static Future removeFromCart(int id)async{
    print("ID Delete $id");
    final dbData = Hive.box<ProductHiveModel>("cart");
    dbData.delete(id);
  }

}
