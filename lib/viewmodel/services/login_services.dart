import 'dart:convert';

import 'package:either_dart/src/either.dart';

import 'package:jyothi_test/model/error_model.dart';

import 'package:jyothi_test/model/login_model.dart';
import 'package:jyothi_test/model/products_model.dart';
import 'package:jyothi_test/utils/constants.dart';

import '../repository/login_repo.dart';

import 'package:http/http.dart' as http;

class LoginServices implements LoginRepository {
  @override
  Future<Either<ErrorModel, LoginModel>> loginUserMethod(
      String userName, String password) async {
    try {
      final response =
          await http.post(Uri.parse("$baseUrl$loginEndpoint"),
      //         headers: {
      //   "Content-Type": 'application/json',
      // },
              body: {
        "username": userName,
        "password": password,
      });

      if (response.statusCode > 199 && response.statusCode < 300) {
        final json = jsonDecode(response.body);
        return Right(LoginModel.fromJson(json));
      } else {
        return Left(ErrorModel(message: response.body));
      }
    } catch (e) {
      print("Exception   loginUserMethod - ${e.toString()}");
      return Left(ErrorModel(message: e.toString()));
    }
  }
}
