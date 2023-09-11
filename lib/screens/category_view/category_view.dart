import 'package:ecommeres/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import '../../firebase_helper/firebase_firestory/firebase_firestory.dart';
import '../../models/product_model/product_model.dart';
import '../product_details/product_details.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productModelList = [];

  bool isLoading = false;
  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);
    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const SizedBox(height: kToolbarHeight*1),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const BackButton(),
                         Text(
                            widget.categoryModel.name,
                            style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w800,
                                color:  Color.fromARGB(213, 154, 15, 201)),
                          ),
                      ],
                    ),
                  ),
                  productModelList.isEmpty
                      ? const Center(
                          child: Text("Best Product is Empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
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
                                    color:
                                        const Color.fromARGB(213, 154, 15, 201)
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
