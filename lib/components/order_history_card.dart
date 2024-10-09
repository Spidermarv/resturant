import 'package:flutter/material.dart';

class OrderhistoryCard extends StatelessWidget {
  const OrderhistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 390,
        height: 150,
        color: Colors.black54,
        child: const Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                  Column(children: [
                    SizedBox(height:20,),
                    Text("Product Names"),
                    SizedBox(width:5,),
                    Text("Quantity"),
                    SizedBox(width:5,),
                    Text("Total"),
                  ],)
                ],),
                SizedBox(height:20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.history),
                    Text("TimeStamp"),
                    SizedBox(width: 20,)
                  ],
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
