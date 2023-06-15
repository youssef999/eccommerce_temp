import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/product_moidel.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoriesModel => _categoriesModel;
  List<CategoryModel> _categoriesModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  String value = '';

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loading.value = true;
    HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
       // _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  changeMethod(String val) {
    value = val;
    update();
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeServices().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
  //      _productModel.add(ProductModel.fromJson(value[i].data()));
        print(_productModel.length);
        _loading.value = false;
      }
      print(productModel.length);

      update();
    });
  }
}
