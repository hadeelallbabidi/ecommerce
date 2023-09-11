import 'package:ecommeres/constants/constants.dart';
import 'package:ecommeres/constants/routes.dart';
import 'package:ecommeres/models/product_model/product_model.dart';
import 'package:ecommeres/provider/app_provider.dart';
import 'package:ecommeres/screens/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

int qty = 1;

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Routes.instance
                    .push(widget: const CartScreen(), context: context);
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.singleProduct.image,
                height: 350,
                width: 350,
                alignment: Alignment.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(213, 154, 15, 201)),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.singleProduct.isFavourite =
                              !widget.singleProduct.isFavourite;
                        });
                        if (widget.singleProduct.isFavourite) {
                          appProvider.addFavouriteProduct(widget.singleProduct);
                        } else {
                          appProvider
                              .removeFavouriteProduct(widget.singleProduct);
                        }
                      },
                      icon: Icon(appProvider.getFavouritProductList
                              .contains(widget.singleProduct)
                          ? Icons.favorite
                          : Icons.favorite_border))
                ],
              ),
              Text(widget.singleProduct.description),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        if (qty >= 1) {
                          qty--;
                        }
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(213, 154, 15, 201)),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      ProductModel productModel =
                          widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCatrProduct(productModel);
                      ShowMessage("Added To Cart");
                    },
                    child: const Text("ADD TO CART"),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  // SizedBox(
                  //   height: 28,
                  //   width: 140,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // ProductModel productModel =
                  //       //     widget.singleProduct.copyWith(qty: qty);
                  //       // Routes.instance.push(
                  //       //     widget: Checkout(singleProduct: productModel),
                  //       //     context: context);
                  //     },
                  //     child: const Text(
                  //       "BUY",
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
