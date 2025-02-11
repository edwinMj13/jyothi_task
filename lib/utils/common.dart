import 'package:flutter/material.dart';

snackBarShow(BuildContext context,String str){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(str)));
}