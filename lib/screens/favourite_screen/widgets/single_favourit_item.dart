import 'package:ecommeres/models/product_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../provider/app_provider.dart';

class SingleFavouritItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouritItem({super.key, required this.singleProduct});

  @override
  State<SingleFavouritItem> createState() => _SingleFavouritItem();
}

class _SingleFavouritItem extends State<SingleFavouritItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      height: 140,
      decoration: BoxDecoration(
          color: const Color.fromARGB(213, 154, 15, 201),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: const Color.fromARGB(213, 154, 15, 201), width: 2.3)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              child: Image.network(widget.singleProduct.image),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 140,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.singleProduct.name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                AppProvider appProvider =
                                    Provider.of<AppProvider>(context,
                                        listen: false);
                                appProvider.removeFavouriteProduct(
                                    widget.singleProduct);
                                ShowMessage("Remove to Wishlist");
                              },
                              child: const Text(
                                "Remove From Wishlist",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${widget.singleProduct.price.toString()}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
