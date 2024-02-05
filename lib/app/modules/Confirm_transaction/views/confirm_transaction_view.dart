import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hova_store/app/components/confirm_transation_component.dart';
import 'package:hova_store/app/core/palettes.dart';
import 'package:hova_store/app/core/responsive_ui.dart';
import 'package:hova_store/app/modules/products/controllers/products_controller.dart';

import '../controllers/confirm_transaction_controller.dart';

class ConfirmTransactionView extends GetView<ConfirmTransactionController> {
  const ConfirmTransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductsController controller =
        Get.put<ProductsController>(ProductsController());
    return Scaffold(
        body: Responsive.isMobile(context)
            ? Container(
                color: AppColors.purpleColor,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AppColors.textWhite,
                                  )),
                              Text(
                                "CONFIRM TRANSACTION ",
                                style: GoogleFonts.openSans(
                                    color: AppColors.textWhite),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset("assets/logo/logo.png",
                                      height: 22, fit: BoxFit.cover),
                                ),
                              )
                            ],
                          ),
                        )),
                    Positioned(
                      top: 70,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        height: MediaQuery.of(context).size.height - 70,
                        width: MediaQuery.of(context).size.width,
                        child: ConfirmTransactionComponent(),
                      ),
                    )
                  ],
                ),
              )
            : ConfirmTransactionComponent());
  }
}
