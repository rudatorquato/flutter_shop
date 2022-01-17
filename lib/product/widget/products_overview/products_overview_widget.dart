import 'package:flutter/material.dart';
import 'package:shop/product/widget/product_grid/product_grid.dart';

class ProductOverviewWidget extends StatelessWidget {
  const ProductOverviewWidget({Key? key}) : super(key: key);

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
      body: const ProductGridWidget(),
    );
  }
}
