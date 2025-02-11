import 'package:flutter/material.dart';
import 'package:jyothi_test/data/hive_storage.dart';
import 'package:jyothi_test/model/products_model.dart';
import 'package:provider/provider.dart';

import '../../model/product_hive_model.dart';
import '../../viewmodel/providers/home_provider.dart';

class CustomGridView extends StatelessWidget {
   const CustomGridView({super.key,required this.prod,required this.callbackAdd,required this.callbackDelete});

  final Products prod;
  final VoidCallback callbackAdd;
  final VoidCallback callbackDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
              child: Image.network(
                prod.thumbnail!,
                height: 120,
                width: 120,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(prod.title!,
                    style: const TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold)),
                // Text(prod.brand!,style: const TextStyle(color: Colors.grey,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(prod.price!.toString(),
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(prod.rating!.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    callbackDelete();
                  },
                  icon: const Icon(Icons.minimize_outlined)),
              IconButton(
                  onPressed: () {
                    callbackAdd();
                  },
                  icon:  const Icon(
                    Icons.add,
                    color: Colors.black,
                  )
              )
            ],
          )
        ],
      ),
    );;
  }
}
