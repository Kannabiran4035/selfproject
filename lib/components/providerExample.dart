import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/productList.dart';
import '../model/productsModel.dart';

class SelectedProduct with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  var _parsed;
  var _datas;
  Product get datas => _datas;
  List<Product> _productList = [];
  List<Product> get productList => _productList;

  Future<Welcome> getproductDetails() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    print(response.statusCode);
    _parsed = Welcome.fromJson(jsonDecode(response.body));
    print(_parsed.products.length);
    return _parsed;
  }

  dynamic get parsed => _parsed;
  void increment() {
    _count++;
    notifyListeners();
  }

  void addtoCart(Product data) {
    _datas = data;
    notifyListeners();
  }

  void addingtoCart(Product product) {
    productList.add(product);
    notifyListeners();
  }
}
