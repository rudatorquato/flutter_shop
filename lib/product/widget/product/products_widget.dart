import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/app_drawer_widget.dart';
import 'package:shop/core/routes/app_routes.dart';
import 'package:shop/product/models/product_list/product_list.dart';
import 'package:shop/product/widget/product_item/product_item_widget.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
              );
            },
          )
        ],
      ),
      drawer: const AppDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItemWidget(products.items[i]),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
