import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:get/get.dart';
import 'package:hova_store/app/modules/home/views/home_view.dart';

class DashboardController extends GetxController
    implements GetTickerProviderStateMixin {
  var selectindex = 0.obs;
  onselectItem(int index) {
    selectindex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }

  @override
  void didChangeDependencies(BuildContext context) {
    // TODO: implement didChangeDependencies
  }
}
