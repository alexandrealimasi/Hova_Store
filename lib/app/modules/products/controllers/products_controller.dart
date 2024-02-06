import 'dart:developer';

import 'package:get/get.dart';
import 'package:hova_store/app/core/constants.dart';
import 'package:hova_store/app/models/product.dart';
import 'package:hova_store/app/repository/dio_service.dart';
import 'package:hova_store/app/repository/hive_storage.dart';

class ProductsController extends GetxController {
  DioService dioService = DioService();
  RxList<Products> listProducts = RxList([]);
  var isloading = false.obs;
  fetchDatas() async {
    isloading.value = true;
    try {
      var response = await dioService.fetchDatas("products");
      if (response.statusCode == 200 || response.data != null) {
        for (var element in (response.data as List)) {
          listProducts.add(Products.fromJson(element));
        }
        isloading.value = false;
      }
    } catch (e) {
      isloading.value = false;
      Get.snackbar("Message", "Error $e");
    }
  }

  var loading = false.obs;
  RxList localListProducts = RxList([]);
  fetshHivedata() async {
    try {
      final resp = await HiveStorage.getData(myProductKey);
      (resp as List).forEach((element) {
        localListProducts.add(element);
      });

      loading.value = false;
      log(resp.toString());
    } catch (e) {
      log("Message Error" + e.toString());
      loading.value = false;
    }
  }

  cleanData() async {
    try {
      await HiveStorage.clearData(key: myProductKey);
      localListProducts.clear();
      listProducts.clear();
      fetshHivedata();
      fetchDatas();
    } catch (e) {
      log(e.toString());
    }
  }

  addToCart(Products products) async {
    try {
      // if (localListProducts.every((element) => element['id'] != products.id)) {
      Products data = Products(
          id: products.id,
          name: products.name,
          price: products.price,
          quantity: products.quantity);

      await HiveStorage.saveData(value: data.toJson(), key: myProductKey);
      localListProducts.clear();
      listProducts.clear();
      fetshHivedata();
      fetchDatas();
      // }
    } catch (e) {
      log(e.toString());
    }
  }

  get totalAmount {
    double data = 0;
    localListProducts.forEach((element) {
      data += double.parse("${element['price']}") *
          double.parse("${element['quantity']}");
    });
    return data;
  }

  @override
  void onInit() {
    super.onInit();
    fetchDatas();
    fetshHivedata();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
