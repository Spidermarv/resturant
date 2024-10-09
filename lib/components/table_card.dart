import "package:flutter/material.dart";

class TableCard extends StatelessWidget {
   TableCard({super.key, required this.tablenumber});
   var tablenumber;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.green,
        height: 100,
        width: 100,
        child: Center(child: Text(tablenumber.toString())),
      ),
    );
  }
}
