import 'package:flutter/material.dart';
import 'package:rest_auto/db_helper.dart';
import '';

class TableManagementScreen extends StatefulWidget {
  final String role;

  const TableManagementScreen({Key? key, this.role = 'guest'}) : super(key: key);

  @override
  _TableManagementScreenState createState() => _TableManagementScreenState();
}

class _TableManagementScreenState extends State<TableManagementScreen> {
  late Future<List<Map<String, dynamic>>> _tablesFuture;

  @override
  void initState() {
    super.initState();
    _tablesFuture = DatabaseHelper.instance.getTables();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Management - Role: ${widget.role}'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _tablesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tables found.'));
          }

          final tables = snapshot.data!;

          return ListView.builder(
            itemCount: tables.length,
            itemBuilder: (context, index) {
              final table = tables[index];
              return ListTile(
                title: Text('Table ${table['id']}: ${table['status']}'),
              );
            },
          );
        },
      ),
    );
  }
}
