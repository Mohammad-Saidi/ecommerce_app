
import 'package:flutter/material.dart';

import '../models/product.dart';


class ProductProvider with ChangeNotifier {

  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void editProduct(int index, Product product) {
    _products[index] = product;
    notifyListeners();
  }

}

