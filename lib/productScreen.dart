import 'package:flutter/material.dart';
import 'package:rest_auto/components/productcard.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({super.key});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Text("Menu", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 600,
                width: 400,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (index,context){
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProductCard(),
                    );
                }),
              ),
              Container(
                color: Colors.transparent,
                width: 300,
                height: 400,
                child: Column(
                  children: [
                    const Row(children: [
                      Text("Total: ", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                      ,Text("0.00",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                    ],),
                    ElevatedButton(
                        onPressed: (){},
                        child: const Text("Pay")
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
