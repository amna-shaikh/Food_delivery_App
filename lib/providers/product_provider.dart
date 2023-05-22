import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Models/product_model.dart';

class ProductProvider with ChangeNotifier {

  late ProductModel productModel;
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),

    );

  }

  List<ProductModel> FruitProductList = [];
  getFruitProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection(
        "Fruitproduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    FruitProductList = newList;
    notifyListeners();
  }
  List<ProductModel> get getFruitProductDataList {
    return FruitProductList;
  }

  /// FOR VEGETABLE
  List<ProductModel> VegetableProductList = [];

  getVegetableProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection(
        "Vegetableproduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    VegetableProductList = newList;
    notifyListeners();
  }
  List<ProductModel> get getVegetableProductDataList {
    return VegetableProductList;
  }

/// FOR POULTRY
  List<ProductModel> PoultryProductList = [];
  getPoultryProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("Poultryproduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    PoultryProductList = newList;
    notifyListeners();
  }
  List<ProductModel>  get getPoultryProductDataList {
    return PoultryProductList;
}

  }
