import 'package:ecommeres/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${appProvider.totalPrice().toString()}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              // PrimarButton(
              //   title: "Checkout",
              //   onPressed: () {
              //     appProvider.clearBuyProduct();
              //     appProvider.addBuyProductCartList();
              //     appProvider.clearCart();
              //     if (appProvider.getBuyProductList.isEmpty) {
              //       ShowMessage("Cart is empty");
              //     } else {
              //      Routes.instance.push(
              //          widget: const CartItemCheckout(), context: context);
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (ctx, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              }),
    );
  }
}
