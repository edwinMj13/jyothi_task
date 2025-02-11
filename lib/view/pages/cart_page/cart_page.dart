import 'package:flutter/material.dart';
import 'package:jyothi_test/model/products_model.dart';
import 'package:jyothi_test/utils/common.dart';
import 'package:jyothi_test/viewmodel/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/grid_view_custom.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartProvider>().getCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) {
        if (value.getProducts!= null && value.getProducts!.isNotEmpty) {
          return Stack(
            children: [
              GridView.builder(
                  itemCount: value.getProducts!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final prod = value.getProducts![index];
                    //print("${prod.title} == ${products[index].title}");
                    final pro = Products.fromJson(prod.toJson());
                    return CustomGridView(
                      prod: pro,
                      callbackDelete: () =>
                          context.read<CartProvider>().deleteFromCart(pro.id!),
                      callbackAdd: () =>
                          context.read<CartProvider>().addToCart(pro),
                    );
                  }),
              Align(
                  alignment:Alignment.bottomCenter,child: ElevatedButton(onPressed: (){
                double amt =0.0;
                for(var i in value.getProducts!){
                      amt+=i.price;
                    }
                    snackBarShow(context, "Total Amount - $amt");
              }, 
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  child: Text("Continue"))),
            ],
          );
        } else {
          return EmptyWidget();
        }
      },
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("There is Nothing Here"));
  }
}
