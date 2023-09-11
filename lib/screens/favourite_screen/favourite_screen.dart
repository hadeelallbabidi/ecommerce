import 'package:ecommeres/screens/favourite_screen/widgets/single_favourit_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class FavouritScreen extends StatelessWidget {
  const FavouritScreen({super.key});

  @override
  Widget build(BuildContext context) {
     AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getFavouritProductList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: appProvider.getFavouritProductList.length,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (ctx, index) {
                return SingleFavouritItem(
                  singleProduct: appProvider.getFavouritProductList[index],
                );
              }),
    );
  }
}