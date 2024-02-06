import 'package:intl/intl.dart';

class Products {
  String? name;
  String? price;
  String? quantity;
  int? id;
  get total {
    return double.parse(price!) * double.parse(quantity!);
  }

  Products({this.name, this.price, this.quantity, this.id});
  var f = NumberFormat("###0.0#", "en_US");
  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = f.format(json['price']);
    quantity = f.format(json['quantity']);
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['id'] = this.id;
    return data;
  }
}
