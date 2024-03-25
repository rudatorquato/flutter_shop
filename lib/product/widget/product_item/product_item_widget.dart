import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/routes/app_routes.dart';
import 'package:shop/product/models/product/product.dart';
import 'package:shop/product/models/product_list/product_list.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  const ProductItemWidget(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (ctx) => 
                  AlertDialog(
                    title: Text("Excluit produto"),
                    content: Text("Tem certeza?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(), 
                        child: Text("Não"),
                      ),
                       TextButton(
                        child: Text("Sim"),
                        onPressed:() {
                        Provider.of<ProductList>(
                        context,
                        listen: false,
                        ).removeProduct(product);
                        Navigator.of(context).pop();
                         }, 
                      )
                    ],
                    )
                  );
              },
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            )
          ],
        ),
      ),
    );
  }
}
