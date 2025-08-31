import 'package:flutter/material.dart';

import '../widgets/product_items.dart';
import 'add_new_product.dart';
import 'update_product.dart';

class ProductionList extends StatefulWidget {
  const ProductionList({super.key});

  @override
  State<ProductionList> createState() => _ProductionListState();
}

class _ProductionListState extends State<ProductionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Production List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: ProductItem(),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewProduct()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


