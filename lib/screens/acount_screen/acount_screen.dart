import 'package:ecommeres/screens/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/routes.dart';
import '../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import '../../provider/app_provider.dart';
import '../favourite_screen/favourite_screen.dart';

class AcountScreen extends StatefulWidget {
  const AcountScreen({super.key});

  @override
  State<AcountScreen> createState() => _AcountScreenState();
}

class _AcountScreenState extends State<AcountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                appProvider.getUserInformation.image == null
                    ? const Icon(
                        Icons.person_outlined,
                        size: 80,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(appProvider.getUserInformation.image!),
                        radius: 55,
                      ),
                Text(appProvider.getUserInformation.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                Text(appProvider.getUserInformation.email),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Routes.instance.push(
                          widget: const FavouritScreen(), context: context);
                    },
                    leading: const Icon(Icons.favorite_outline),
                    title: const Text("Favourite"),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.instance
                          .push(widget: const CartScreen(), context: context);
                    },
                    leading: const Icon(Icons.card_giftcard_outlined),
                    title: const Text("Cards"),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuthHelper.instance.singOut();
                      setState(() {});
                    },
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text("Log Out"),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text("Version 1.0.0")
                ],
              ))
        ],
      ),
    );
  }
}
