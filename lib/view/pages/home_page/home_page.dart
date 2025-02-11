import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jyothi_test/data/hive_storage.dart';
import 'package:jyothi_test/model/product_hive_model.dart';
import 'package:jyothi_test/model/products_model.dart';
import 'package:jyothi_test/view/pages/cart_page/cart_page.dart';
import 'package:jyothi_test/viewmodel/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/grid_view_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductHiveModel> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBox();
  }

  openBox() async {
    await Hive.openBox<ProductHiveModel>("cart").then((_) {
      if (context.mounted) {
        context.read<HomeProvider>().getProducts();
      }
      products = HiveOperations.getDatas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, _) {
      if (value.productsModel != null) {
        return Column(

          children: [
            Expanded(
                child: Stack(
              children: [

                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final prod = value.productsModel!.products![index];
                    //print("${prod.title} == ${products[index].title}");
                    return CustomGridView(
                        prod: prod,
                        callbackDelete: () => context
                            .read<HomeProvider>()
                            .deleteFromCart(prod.id!),
                        callbackAdd: () =>
                            context.read<HomeProvider>().addToCart(prod));
                  },
                  itemCount: value.productsModel!.products!.length,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                    child: Text(
                      "#${value.productsModel!.total.toString()}",
                      style: TextStyle(color: Colors.black,),
                    )),

              ],
            ))
          ],
        );
      }
      return EmptyWidget();
    });
  }
}
