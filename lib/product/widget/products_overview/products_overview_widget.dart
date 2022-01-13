import 'package:flutter/material.dart';
import 'package:shop/core/data/dummy_data.dart';
import 'package:shop/product/models/product.dart';
import 'package:shop/product/widget/product_item/product_item_widget.dart';

class ProductOverviewWidget extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductOverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Minha Loja',
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItemWidget(product: loadedProducts[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
