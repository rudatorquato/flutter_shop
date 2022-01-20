import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/product/models/product_list/product_list.dart';
import 'package:shop/product/widget/product_grid/product_grid.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProductOverviewWidget extends StatelessWidget {
  const ProductOverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Minha Loja',
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.all,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          )
        ],
      ),
      body: const ProductGridWidget(),
    );
  }
}
