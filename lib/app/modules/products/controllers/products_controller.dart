import 'dart:developer';

import 'package:get/get.dart';
import 'package:hova_store/app/core/constants.dart';
import 'package:hova_store/app/models/product.dart';
import 'package:hova_store/app/modules/Confirm_transaction/controllers/confirm_transaction_controller.dart';
import 'package:hova_store/app/repository/dio_service.dart';
import 'package:hova_store/app/repository/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsController extends GetxController {
  DioService dioService = DioService();
  List<Products> listProducts = [];
  ConfirmTransactionController controller =
      Get.put<ConfirmTransactionController>(ConfirmTransactionController());
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

  RxList<Products> productsList = RxList([]);

  addToCart(Products products) {
    if (productsList.every((element) => element.id != products.id)) {
      productsList.add(products);
      update();
    }
  }

  get totalAmount {
    double data = 0;
    productsList.forEach((element) {
      data += element.total;
    });
    return data;
  }

  @override
  void onInit() {
    super.onInit();
    fetchDatas();
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
