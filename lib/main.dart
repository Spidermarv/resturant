
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_auto/components/nav.dart';

import 'Providers/foodcart.dart';

void main() async{


  runApp(
      // Provider to be used all across the application
      MultiProvider(
       providers:[
       ChangeNotifierProvider(create: (_)=> foodcartProvider())
       ],
       child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:NavBar()
    );
  }
}
