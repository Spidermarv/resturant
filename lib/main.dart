import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'package:rest_auto/screens/table_management_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Run initialization logic (such as inserting initial tables)
  await initializeApp();

  runApp(const MyApp());
}

Future<void> initializeApp() async {
  final dbHelper = DatabaseHelper.instance;
  final tables = await dbHelper.getTables();

  // If tables are empty, insert 8 initial tables with status 'free'
  if (tables.isEmpty) {
    for (int i = 0; i < 8; i++) {
      await dbHelper.insertTable('free');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Table Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TableManagementScreen(role: 'manager'), // Adjust this role as needed
    );
  }
}
