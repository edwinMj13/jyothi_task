import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyothi_test/view/pages/login_page/login_page.dart';
import 'package:jyothi_test/view/pages/main_page/main_page.dart';

class Routes{



 static  Route<dynamic> generatedRoutes(RouteSettings setings){
    print("Current Route - ${setings.name}");

    switch(setings.name){
      case "loginPage":
        return MaterialPageRoute(builder: (context)=>LoginPage());
      case "mainPage":
        return MaterialPageRoute(builder: (context)=>const MainPage());


      default :
        return MaterialPageRoute(builder: (context)=>const Text("No Route Generated"));
    }
  }
}