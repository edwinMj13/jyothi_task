import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jyothi_test/config/route_names.dart';
import 'package:jyothi_test/config/routes.dart';
import 'package:jyothi_test/viewmodel/providers/cart_provider.dart';
import 'package:jyothi_test/viewmodel/providers/home_provider.dart';
import 'package:jyothi_test/viewmodel/providers/login_provider.dart';
import 'package:provider/provider.dart';

import 'model/product_hive_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(ProductHiveModelAdapter().typeId)){
    Hive.registerAdapter(ProductHiveModelAdapter());
  }
  if(!Hive.isAdapterRegistered(ReviewsAdapter().typeId)){
    Hive.registerAdapter(ReviewsAdapter());
  }
  if(!Hive.isAdapterRegistered(MetaAdapter().typeId)){
    Hive.registerAdapter(MetaAdapter());
  }
  if(!Hive.isAdapterRegistered(DimensionsAdapter().typeId)){
    Hive.registerAdapter(DimensionsAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ListenableProvider(create: (context) => LoginProvider(),),
        ListenableProvider(create: (context) => HomeProvider(),),
        ListenableProvider(create: (context) => CartProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.generatedRoutes,
        initialRoute: RouteNames.loginPage,
      ),
    );
  }
}
