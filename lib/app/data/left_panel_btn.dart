import 'package:flutter/material.dart';
import 'package:hova_store/app/core/responsive_ui.dart';
import 'package:hova_store/app/modules/expenses/views/expenses_view.dart';
import 'package:hova_store/app/modules/home/views/home_view.dart';
import 'package:hova_store/app/modules/sell/views/sell_view.dart';
import 'package:hova_store/app/modules/settings/views/settings_view.dart';
import 'package:hova_store/app/modules/transactions/views/transactions_view.dart';

class LeftPanelBtn {
  final int id;
  final Icon icon;
  final String label;

  LeftPanelBtn({required this.icon, required this.label, required this.id});

  static List listBtn = <LeftPanelBtn>[
    LeftPanelBtn(
      id: 1,
      icon: const Icon(Icons.home_work),
      label: "Home",
    ),
    LeftPanelBtn(
        icon: const Icon(Icons.shopping_bag_outlined), label: "SELL", id: 2),
    LeftPanelBtn(icon: const Icon(Icons.money), label: "Transactions", id: 3),
    LeftPanelBtn(icon: const Icon(Icons.money), label: "EXPENSES", id: 4),
    LeftPanelBtn(icon: const Icon(Icons.settings), label: "SETTING", id: 5)
  ];

  static List screens = <Widget>[
    const HomeView(),
    const SellView(),
    const TransactionsView(),
    const ExpensesView(),
    const SettingsView(),
  ];
}
