import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:productlist/models/product.dart';
import 'package:productlist/utils/urls.dart';

import '../widgets/product_items.dart';
import 'add_new_product.dart';
import 'update_product.dart';

class ProductionList extends StatefulWidget {
  const ProductionList({super.key});

  @override
  State<ProductionList> createState() => _ProductionListState();
}

class _ProductionListState extends State<ProductionList> {
  List<Product> _productList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductInfo();
  }

  Future<void> _getProductInfo() async{
    Uri uri = Uri.parse(Urls.getProductUrl);

    Response response = await get(uri);


    debugPrint(response.statusCode.toString());
    debugPrint(response.body);


    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      for(Map<String, dynamic> productJson in decodedJson['data']){
        Product product = Product();
        product.id = productJson['_id'];
        product.name = productJson['ProductName'];
        product.code = productJson['ProductCode'];
        product.img = productJson['Img'];
        product.quantity = productJson['Qty'];
        product.unitPrice = productJson['UnitPrice'];
        product.totalPrice = productJson['TotalPrice'];

        _productList.add(product);
      }
    }
    setState(() {});
  }

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
      body: ListView.builder(
          itemCount: _productList.length,
          itemBuilder: (context, index){
        return ProductItems(product: _productList[index]);
      }),

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


