import 'package:flutter/material.dart';
import 'package:shop/core/routes/app_routes.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({Key? key}) : super(key: key);
//"tela de entrada"
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Menu!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.HOME,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ORDERS,
              );
            },
          ),
        ],
      ),
    );
  }
}
