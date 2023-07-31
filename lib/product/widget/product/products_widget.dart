import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/app_drawer_widget.dart';
import 'package:shop/product/models/product_list/product_list.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar produtos'),
      ),
      drawer: const AppDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) => Text(products.items[i].name),
        ),
      ),
    );
  }
}
