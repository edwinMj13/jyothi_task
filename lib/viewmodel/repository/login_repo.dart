import 'package:either_dart/either.dart';
import 'package:jyothi_test/model/error_model.dart';
import 'package:jyothi_test/model/login_model.dart';

abstract class LoginRepository{
Future<Either<ErrorModel,LoginModel>> loginUserMethod(String userName,String password);
}