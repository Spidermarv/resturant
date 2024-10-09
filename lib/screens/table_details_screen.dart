import 'package:flutter/material.dart';
import 'package:rest_auto/db_helper.dart';

class TableDetailsScreen extends StatelessWidget {
  final int tableId;
  const TableDetailsScreen({super.key, required this.tableId});

  @override
  Widget build(BuildContext context) {
    final dbHelper = DatabaseHelper.instance;

    return Scaffold(
      appBar: AppBar(title: Text('Table $tableId Details')),
      body: FutureBuilder(
        future: dbHelper.getOrdersByTable(tableId),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final orders = snapshot.data!;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                title: Text('${order['productName']} (x${order['quantity']})'),
                subtitle: Text('Status: ${order['status']}'),
              );
            },
          );
        },
      ),
    );
  }
}
