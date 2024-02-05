import 'package:get/get.dart';

import '../controllers/confirm_transaction_controller.dart';

class ConfirmTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmTransactionController>(
      () => ConfirmTransactionController(),
    );
  }
}
