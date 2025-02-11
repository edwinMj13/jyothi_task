import 'package:either_dart/either.dart';
import 'package:jyothi_test/model/error_model.dart';
import 'package:jyothi_test/model/products_model.dart';

abstract class HomeRepository{
  Future<Either<ErrorModel,ProductsModel>> getAllProducts();
}