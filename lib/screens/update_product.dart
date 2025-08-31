import 'package:flutter/material.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameTEController = TextEditingController();
  TextEditingController _codeTEController = TextEditingController();
  TextEditingController _imgTEController = TextEditingController();
  TextEditingController _quantityTEController = TextEditingController();
  TextEditingController _upriceTEController = TextEditingController();

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
                    ),

                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _codeTEController,
                      decoration: InputDecoration(
                          labelText: 'Product Code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
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
                    ),
                    FilledButton(onPressed: (){}, child: Text('Update'))
                  ]),
            )),
      ),
    );
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

