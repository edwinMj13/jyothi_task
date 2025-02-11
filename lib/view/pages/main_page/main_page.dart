import 'package:flutter/material.dart';
import 'package:jyothi_test/viewmodel/providers/home_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
      ),
      body: ValueListenableBuilder<int>(
          valueListenable: HomeProvider.currentPageNotifier,
          builder: (context, value, _) =>
              context.read<HomeProvider>().currentIndex(value)),
      bottomNavigationBar: ValueListenableBuilder<int>(
        builder: (context, value, _) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
            ],
            currentIndex: value,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: context.read<HomeProvider>().updatePage,
          );
        },
        valueListenable: HomeProvider.currentPageNotifier,
      ),
    );
  }
}
