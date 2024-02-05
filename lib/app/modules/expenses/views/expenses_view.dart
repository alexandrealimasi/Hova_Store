import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/expenses_controller.dart';

class ExpensesView extends GetView<ExpensesController> {
  const ExpensesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpensesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExpensesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
