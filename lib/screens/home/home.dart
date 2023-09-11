import 'package:ecommeres/constants/routes.dart';
import 'package:ecommeres/firebase_helper/firebase_firestory/firebase_firestory.dart';
import 'package:ecommeres/models/category_model/category_model.dart';
import 'package:ecommeres/provider/app_provider.dart';
import 'package:ecommeres/screens/category_view/category_view.dart';
import 'package:ecommeres/screens/product_details/product_details.dart';
import 'package:ecommeres/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoading = false;
  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();

    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TopTitle(title: "E Commerce", subtitle: ""),
                        const Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  categoriesList.isEmpty
                      ? const Center(
                          child: Text("Categories  is empty"),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categoriesList
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CupertinoButton(
                                        onPressed: () {
                                          Routes.instance.push(
                                              widget: CategoryView(
                                                  categoryModel: e),
                                              context: context);
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 13.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(e.image),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      textAlign: TextAlign.start,
                      "Best Products",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  productModelList.isEmpty
                      ? const Center(
                          child: Text("Best Product is Empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                          child: GridView.builder(
                              padding: const EdgeInsets.only(bottom: 50),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: productModelList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 0.7,
                                      crossAxisCount: 2),
                              itemBuilder: (ctx, index) {
                                ProductModel singlerProduct =
                                    productModelList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(212, 158, 22, 203)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        singlerProduct.image,
                                        height: 130,
                                        width: 130,
                                      ),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      Text(
                                        singlerProduct.name,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text("Price: \$${singlerProduct.price}"),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 130,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              Routes.instance.push(
                                                  widget: ProductDetails(
                                                      singleProduct:
                                                          singlerProduct),
                                                  context: context);
                                            },
                                            style: OutlinedButton.styleFrom(),
                                            child: const Text(
                                              "Buy",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      213, 154, 15, 201)),
                                            )),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
    );
  }
}
