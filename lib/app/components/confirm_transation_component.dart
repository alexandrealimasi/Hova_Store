import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hova_store/app/core/palettes.dart';
import 'package:hova_store/app/core/responsive_ui.dart';
import 'package:hova_store/app/models/product.dart';

import '../modules/products/controllers/products_controller.dart';

class ConfirmTransactionComponent extends StatelessWidget {
  const ConfirmTransactionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController controller =
        Get.put<ProductsController>(ProductsController());
    return Obx(
      () => Container(
        color: !Responsive.isMobile(context) ? AppColors.cardColor : null,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Please review the selected products and the total amount to confirm the transaction..",
                  style: GoogleFonts.openSans(
                      color: !Responsive.isMobile(context)
                          ? AppColors.textWhite
                          : AppColors.textDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                        style: BorderStyle.solid,
                        width: 1,
                        color: !Responsive.isMobile(context)
                            ? AppColors.textWhite
                            : AppColors.purpleColor,
                      )),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ))),
                  onPressed: () {},
                  child: Text("Clean".toUpperCase(),
                      style: GoogleFonts.openSans(
                          color: !Responsive.isMobile(context)
                              ? AppColors.textWhite
                              : AppColors.purpleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12))),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 615,
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: controller.productsList.length,
                      itemBuilder: (context, index) {
                        Products products = controller.productsList[index];
                        return ListTile(
                          leading: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${products.name}",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text(
                                  "QTY ${controller.productsList[index].quantity} x ${controller.productsList[index].price}",
                                  style: GoogleFonts.openSans(
                                    color: AppColors.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ))
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: const Icon(Icons.more_horiz)),
                              Text("${controller.productsList[index].total}")
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(
                        "Before Disc.",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Text("RFR ${controller.totalAmount}",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    ListTile(
                      trailing: Text("RFR ${controller.totalAmount * 18 / 100}",
                          style: GoogleFonts.openSans(
                              color: AppColors.subTitle,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                      leading: Text("Tax (18%)",
                          style: GoogleFonts.openSans(
                              color: AppColors.subTitle,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                    ),
                    Container(
                      color: AppColors.purpleColor,
                      child: ListTile(
                        leading: Text("After Disc.",
                            style: GoogleFonts.openSans(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.w800,
                                fontSize: 16)),
                        trailing: Text(
                            "RFR ${controller.totalAmount + (controller.totalAmount * 18 / 100)}",
                            style: GoogleFonts.openSans(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.w800,
                                fontSize: 16)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: AppColors.textDark,
                                          width: 1))),
                              foregroundColor:
                                  MaterialStatePropertyAll(AppColors.textDark),
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColors.textWhite)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                ),
                                Text("Customer".toUpperCase(),
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w800,
                                    ))
                              ],
                            ),
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: AppColors.textDark,
                                          width: 1))),
                              foregroundColor:
                                  MaterialStatePropertyAll(AppColors.textDark),
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColors.textWhite)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                ),
                                Text("PAYMENT METHOD",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w800,
                                    ))
                              ],
                            ),
                          ))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  controller.productsList.isNotEmpty
                      ? Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: BorderSide(
                                              color: AppColors.redColor,
                                              width: 1))),
                                  foregroundColor: MaterialStatePropertyAll(
                                      AppColors.redColor),
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.textWhite)),
                              onPressed: () {
                                controller.productsList.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("CLEAR".toUpperCase(),
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w800,
                                    )),
                              )))
                      : Container(),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: AppColors.textWhite,
                                          width: 1))),
                              foregroundColor:
                                  MaterialStatePropertyAll(AppColors.textWhite),
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColors.purpleColor)),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: controller.productsList.isNotEmpty
                                ? Text("CONFIRM TRANSACTION",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w800,
                                    ))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.verified_user),
                                      Text("CONFIRM TRANSACTION",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w800,
                                          ))
                                    ],
                                  ),
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
