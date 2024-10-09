import 'package:flutter/material.dart';
import 'package:rest_auto/components/assigned_card.dart';
import 'package:rest_auto/components/busy.dart';
import 'package:rest_auto/components/headline.dart';

import 'components/table_card.dart';


class TMS extends StatefulWidget {
  const TMS({super.key});

  @override
  State<TMS> createState() => _TMSState();
}

class _TMSState extends State<TMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column( children:[
            const SizedBox(height: 20,),
            const Text("Restaurant",style: TextStyle(fontSize: 25),),
            const Center(child: Headline()),
            const SizedBox(height: 10,),
            const Text("Tables",style: TextStyle(fontSize: 20),),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("Green ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                    Text("means That it's Free"),
                  ],),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("Red ", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                    Text("means That Busy"),
                  ],),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("Gray ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                    Text("means That it'Assigned to a waiter"),
                  ],),
                ),
            ],),
            const SizedBox(height: 10,),
            SizedBox(
              height: 500,
              child: GridView.builder(
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                 if(index <5){
                   return  Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: AssignedCard(tablenumber: index,),
                   );
                 }else if(index <=13){
                   return  Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TableCard(tablenumber: index,),
                   );
                 }else{
                    return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BusyCard(tablenumber: index,),
                    );
                  }
                },
                itemCount: 20,
              ),
            ),

          ]),
        ),
      )
    );
  }
}
