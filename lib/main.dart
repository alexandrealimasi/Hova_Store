import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/repository/shared_preferences_helper.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initialize();
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
