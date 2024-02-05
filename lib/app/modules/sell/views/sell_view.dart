import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hova_store/app/core/palettes.dart';
import 'package:hova_store/app/core/responsive_ui.dart';
import 'package:hova_store/app/modules/Confirm_transaction/views/confirm_transaction_view.dart';
import 'package:hova_store/app/modules/products/views/products_view.dart';
import 'package:hova_store/app/modules/transactions/views/transactions_view.dart';

import '../controllers/sell_controller.dart';

class SellView extends GetView<SellController> {
  const SellView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: !Responsive.isMobile(context)
            ? AppBar(
                backgroundColor: AppColors.textWhite,
                elevation: 0,
                toolbarHeight: 80,
                title: Container(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(236, 222, 232, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child:
                            const Icon(Icons.store, color: AppColors.cardColor),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "HOVA STORE LTD",
                        style: GoogleFonts.openSans(
                            color: AppColors.cardColor,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                actions: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person_2_outlined,
                                color: AppColors.purpleColor,
                              ),
                              label: Text(
                                "Xavier N.",
                                style: GoogleFonts.openSans(
                                    color: AppColors.textDark,
                                    fontWeight: FontWeight.w700),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.logout_outlined,
                              color: AppColors.purpleColor,
                            ),
                            label: Text(
                              "Logout",
                              style: GoogleFonts.openSans(
                                  color: AppColors.purpleColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 10)),
                                side: MaterialStatePropertyAll(BorderSide(
                                    style: BorderStyle.solid,
                                    width: 1,
                                    color: AppColors.purpleColor)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ))),
                          ),
                        ],
                      ))
                ],
              )
            : null,
        body: !Responsive.isMobile(context)
            ? Padding(
                padding: const EdgeInsets.only(top: 25, left: 30),
                child: Row(
                  children: [
                    const Expanded(flex: 5, child: ProductsView()),
                    const SizedBox(
                      width: 5,
                    ),
                    if (!Responsive.isMobile(context))
                      const Expanded(flex: 5, child: ConfirmTransactionView())
                  ],
                ),
              )
            : Container(
                color: AppColors.purpleColor,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AppColors.textWhite,
                                  )),
                              Text(
                                "NEW TRANSACTION",
                                style: GoogleFonts.openSans(
                                    color: AppColors.textWhite),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(ConfirmTransactionView());
                                },
                                child: CircleAvatar(
                                  radius: 49,
                                  backgroundColor: AppColors.textDark,
                                  child: Stack(children: [
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: AppColors.textWhite,
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.redColor,
                                            ),
                                            child: const Text(
                                              "13",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: AppColors.textWhite),
                                            )))
                                  ]),
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
                        child: const ProductsView(),
                      ),
                    )
                  ],
                ),
              ));
  }
}
