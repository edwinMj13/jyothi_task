import 'package:flutter/material.dart';
import 'package:jyothi_test/config/route_names.dart';
import 'package:jyothi_test/model/login_model.dart';
import 'package:jyothi_test/utils/common.dart';
import 'package:jyothi_test/viewmodel/services/login_services.dart';

import '../../data/local_data.dart';

class LoginProvider extends ChangeNotifier{
  LoginServices loginServices = LoginServices();
  loginMethod(String username,String password,BuildContext context) async {
    await loginServices.loginUserMethod(username, password).then((loginDetails){
      final data = loginDetails.fold((fnL)=>fnL, (fnR)=>fnR);
      if(context.mounted) {
        if (data is LoginModel) {
          LocalData.saveUserData(data);
          Navigator.pushNamed(context, RouteNames.mainPage);
        } else {
          snackBarShow(context,"Login Error");
        }
      }
    });
  }

}