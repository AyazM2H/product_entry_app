import 'package:flutter/material.dart';
import 'package:productlist/models/product.dart';
import 'package:productlist/screens/update_product.dart';


class ProductItems extends StatelessWidget {
  const ProductItems({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Code: ${product.code}'),
            Row(
              spacing: 16,
              children: [
                Text('Quantity: ${product.quantity}'),
                Text('Unit price ${product.unitPrice}')],
            ),
          ],
        ),

        trailing: PopupMenuButton<ProductOpt>(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: ProductOpt.update,
                child: Text('Update'),
              ),
              PopupMenuItem(
                value: ProductOpt.delete,
                child: Text('Delete'),
              ),
            ];
          },
          onSelected: (ProductOpt selectedOption) {
            if(selectedOption == ProductOpt.update){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProduct()),);
            }else{
              print('delete');
            }
          },
        ),
      ),
    );
  }
}

enum ProductOpt { update, delete }