import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hova_store/app/core/palettes.dart';
import 'package:hova_store/app/core/responsive_ui.dart';
import 'package:hova_store/app/data/left_panel_btn.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DashboardController controller =
        Get.put<DashboardController>(DashboardController());

    return Obx(() => Scaffold(
          bottomNavigationBar: Responsive.isMobile(context)
              ? BottomNavigationBar(
                  currentIndex: controller.selectindex.value,
                  selectedItemColor: AppColors.subTitle,
                  unselectedItemColor: AppColors.purpleColor,
                  onTap: (value) {
                    controller.onselectItem(value);
                  },
                  items: [
                      ...LeftPanelBtn.listBtn
                          .map((e) => BottomNavigationBarItem(
                              icon: e.icon, label: e.label))
                          .toList()
                    ])
              : null,
          body: Row(
            children: [
              if (!Responsive.isMobile(context))
                NavigationRail(
                    indicatorShape: BeveledRectangleBorder(),
                    labelType: NavigationRailLabelType.all,
                    selectedLabelTextStyle:
                        TextStyle(color: AppColors.textWhite),
                    onDestinationSelected: (value) =>
                        controller.onselectItem(value),
                    backgroundColor: AppColors.cardColor,
                    leading: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      color: AppColors.purpleColor,
                      child: Text(
                        "Hova Store".toUpperCase(),
                      ),
                    ),
                    destinations: [
                      ...LeftPanelBtn.listBtn
                          .map((e) => NavigationRailDestination(
                              indicatorColor: AppColors.textWhite,
                              icon: e.icon,
                              label: Text(e.label)))
                          .toList()
                    ],
                    selectedIndex: controller.selectindex.value),
              Expanded(
                  child: LeftPanelBtn.screens[controller.selectindex.value])
            ],
          ),
        ));
  }
}
