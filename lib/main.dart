import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hova_store/app/repository/dio_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Hive.initFlutter();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Open Sans",
      ),
      debugShowCheckedModeBanner: false,
      title: "Hova Store",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
