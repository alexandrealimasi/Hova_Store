import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hova_store/app/modules/transactions/views/transactions_view.dart';

import '../../products/views/products_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home View"),
    );
  }
}
