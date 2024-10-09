import 'package:flutter/material.dart';
import 'package:rest_auto/db_helper.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final dbHelper = DatabaseHelper.instance;
  int? selectedTable;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Place Order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder(
              future: dbHelper.getTables(),
              builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final tables = snapshot.data!;
                return DropdownButtonFormField<int>(
                  value: selectedTable,
                  hint: const Text('Select Table'),
                  items: tables.map((table) {
                    return DropdownMenuItem<int>(
                      value: table['id'],
                      child: Text('Table ${table['id']}'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTable = value;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: productNameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final productName = productNameController.text;
                final quantity = int.tryParse(quantityController.text) ?? 0;

                if (selectedTable != null && productName.isNotEmpty && quantity > 0) {
                  await dbHelper.insertOrder(selectedTable!, productName, quantity);
                  Navigator.pop(context); // Return to the previous screen
                }
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
