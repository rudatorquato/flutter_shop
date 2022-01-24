import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/product/models/product/product.dart';

import 'package:shop/product/models/product_list/product_list.dart';
import 'package:shop/product/widget/product_item/product_item_widget.dart';

class ProductGridWidget extends StatelessWidget {
  final bool showFavoriteOnly;
  const ProductGridWidget(this.showFavoriteOnly, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: const ProductItemWidget(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
