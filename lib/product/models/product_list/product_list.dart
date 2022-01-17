import 'package:flutter/cupertino.dart';
import 'package:shop/core/data/dummy_data.dart';
import 'package:shop/product/models/product/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
