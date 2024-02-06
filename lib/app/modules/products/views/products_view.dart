import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hova_store/app/core/palettes.dart';
import 'package:hova_store/app/core/responsive_ui.dart';
import 'package:hova_store/app/models/product.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductsController controller =
        Get.put<ProductsController>(ProductsController());
    return Obx(
      () => Column(
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(
                      Icons.qr_code_scanner,
                      color: AppColors.textDark,
                    ),
                    hintText: "Search by name / barcode"),
              )),
          Expanded(
              child: controller.isloading.value
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: !Responsive.isMobile(context) ? 2 : 1,
                          childAspectRatio: 2.5,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5),
                      itemCount: controller.listProducts.length,
                      itemBuilder: (context, index) {
                        Products product = controller.listProducts[index];
                        return Container(
                          // padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.subTitle,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromRGBO(
                                                  26, 156, 108, 1)),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Text("${product.quantity}",
                                          style: GoogleFonts.openSans(
                                              color: const Color.fromRGBO(
                                                  26, 156, 108, 1),
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("${product.name}"),
                                    const Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.purpleColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.more_horiz,
                                        color: AppColors.purpleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, bottom: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "RFR".toUpperCase(),
                                            style: GoogleFonts.openSans(
                                              color: AppColors.textDark,
                                              fontWeight: FontWeight.w800,
                                            )),
                                        const TextSpan(text: "\t"),
                                        TextSpan(
                                            text: "${product.price}"
                                                .toUpperCase(),
                                            style: GoogleFonts.openSans(
                                              color: AppColors.textDark,
                                              fontWeight: FontWeight.w800,
                                            ))
                                      ]),
                                    ),
                                    double.parse("${controller.listProducts[index].quantity}") <
                                            0
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                "Out of stock".toUpperCase(),
                                                style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w800,
                                                )),
                                          )
                                        : controller.localListProducts.every(
                                                (element) =>
                                                    element.id != product.id)
                                            ? ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5),
                                                            side: const BorderSide(
                                                                color: AppColors
                                                                    .textDark,
                                                                width: 1))),
                                                    foregroundColor: const MaterialStatePropertyAll(
                                                        AppColors.textWhite),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            AppColors.purpleColor)),
                                                onPressed: () {
                                                  controller.addToCart(product);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      "ADD TO CART"
                                                          .toUpperCase(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      )),
                                                ))
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Already added"
                                                        .toUpperCase(),
                                                    style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    )),
                                              )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ))
        ],
      ),
    );
  }
}
