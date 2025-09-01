import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:productlist/models/product.dart';
import 'package:productlist/utils/urls.dart';
import 'package:productlist/widgets/snackbar_msg.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key, required this.product});

  final Product product;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {


  bool _addProductInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameTEController = TextEditingController();
  TextEditingController _codeTEController = TextEditingController();
  TextEditingController _imgTEController = TextEditingController();
  TextEditingController _quantityTEController = TextEditingController();
  TextEditingController _upriceTEController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTEController.text = widget.product.name;
    _codeTEController.text = widget.product.code.toString();
    _imgTEController.text = widget.product.img;
    _quantityTEController.text = widget.product.quantity.toString();
    _upriceTEController.text = widget.product.unitPrice.toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Product',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  spacing: 15,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _nameTEController,
                      decoration: InputDecoration(
                          labelText: 'Product Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _codeTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Product Code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _imgTEController,
                      decoration: InputDecoration(
                          labelText: 'Image Url',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _quantityTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Quantity',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      controller: _upriceTEController,
                      decoration: InputDecoration(
                          labelText: 'Unit Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),
                    Visibility(
                        visible: _addProductInProgress == false,
                        replacement: Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: FilledButton(onPressed: updateData, child: Text('Update')))
                  ]),
            )),
      ),
    );
  }

  Future<void> updateData() async{
    if(_formKey.currentState!.validate() == false){
      return;
    }

    _addProductInProgress = true;
    setState(() {});

    Uri uri = Uri.parse(Urls.updateProductUrl(widget.product.id));

    int totalPrice = int.parse(_quantityTEController.text) * int.parse(_upriceTEController.text);

    Map<String, dynamic> requestBody = {
      "ProductName": _nameTEController.text.trim(),
      "ProductCode": int.parse(_codeTEController.text.trim()),
      "Img": _imgTEController.text.trim(),
      "Qty": int.parse(_quantityTEController.text.trim()),
      "UnitPrice": int.parse(_upriceTEController.text.trim()),
      "TotalPrice": totalPrice
    };

    Response response = await post(
        uri,
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode(requestBody));
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      if(decodedJson['status']=='success'){
        snackBarMsg(context, 'Product Updated Successfully');
      }else{
        String errorMsg = decodedJson['data'];
        snackBarMsg(context, errorMsg);
      }
    }

    _addProductInProgress = false;
    setState(() {});
  }


  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _imgTEController.dispose();
    _quantityTEController.dispose();
    _upriceTEController.dispose();
    super.dispose();
  }
}

