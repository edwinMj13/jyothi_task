import 'dart:convert';

import 'package:either_dart/src/either.dart';
import 'package:jyothi_test/model/error_model.dart';
import 'package:jyothi_test/model/products_model.dart';
import 'package:jyothi_test/viewmodel/repository/home_repo.dart';
import 'package:http/http.dart' as http;

import '../../model/login_model.dart';
import '../../utils/constants.dart';
class HomeServices extends HomeRepository{
  @override
  Future<Either<ErrorModel, ProductsModel>> getAllProducts() async {
    try{
      final response = await http.get(Uri.parse("$baseUrl$productsEndpoint"));

      if(response.statusCode>199 && response.statusCode<300){
        final json = jsonDecode(response.body);
        return Right(ProductsModel.fromJson(json));
      }else{
        return Left(ErrorModel(message: response.body));
      }
    }catch(e){
      print("Exception   getAllProducts - ${e.toString()}");
      return Left(ErrorModel(message: e.toString()));
    }
  }

}