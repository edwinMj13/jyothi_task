import 'package:flutter/material.dart';
import 'package:jyothi_test/viewmodel/providers/home_provider.dart';
import 'package:jyothi_test/viewmodel/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/login_input_texts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final usernameController = TextEditingController();

 final passwordController = TextEditingController();

 final _formKey = GlobalKey<FormState>();

 validationss(){
   final isTrue = _formKey.currentState!.validate();
   if(isTrue){
     return true;
   }
   return false;
 }

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Login",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                const SizedBox(height: 50,),
                //SizedBox(height: 50,),
                const Text("Username"),
                LoginInputText(controller: usernameController,tag: "Enter valid username",),
                const SizedBox(height: 50,),
                const Text("Password"),
                LoginInputText(controller: passwordController,tag: "Enter password",),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      if(validationss()){
                        context.read<LoginProvider>().loginMethod(usernameController.text.trim(),passwordController.text.trim(),context);
                      }
                    }, child: const Text("Login")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

