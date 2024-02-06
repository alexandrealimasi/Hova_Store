import 'package:intl/intl.dart';

class Products {
  String? name;
  int? price;
  int? quantity;
  int? id;
  double total() {
    double x = 0.0;
    x = double.parse(price == null ? "0" : "$price") *
        double.parse(quantity == null ? "0" : "$quantity");
    return x;
  }

  Products({this.name, this.price, this.quantity, this.id});
  // var f = NumberFormat("###0.0#", "en_US");
  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['id'] = id;
    return data;
  }
}
