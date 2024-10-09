import 'package:flutter/material.dart';
import 'package:rest_auto/components/order_history_card.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Text("Order History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              const SizedBox(height: 20,),
              SizedBox(
                width: 390,
                height: 3000,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (index,context){
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: OrderhistoryCard(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
