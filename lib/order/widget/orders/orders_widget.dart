import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/app_drawer_widget.dart';
import 'package:shop/order/models/order_list/order_list.dart';
import 'package:shop/order/widget/order/order_widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Meus Pedidos')),
      ),
      drawer: const AppDrawerWidget(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
        itemCount: orders.itemsCount,
      ),
    );
  }
}
