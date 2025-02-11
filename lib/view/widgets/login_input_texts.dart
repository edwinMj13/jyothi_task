import 'package:flutter/material.dart';

class LoginInputText extends StatelessWidget {
  const LoginInputText({
    super.key,
    required this.controller,
    required this.tag,
  });

  final TextEditingController controller;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5,color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,

        ),
        validator: (val){
          if(val!.isEmpty){
            return tag;
          }
          return null;
        },
      ),
    );
  }
}
