import 'package:flutter/material.dart';
import 'package:productlist/screens/update_product.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(),
            title: Text('Product Name'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product code'),
                Row(
                  spacing: 16,
                  children: [Text('Quantity'), Text('Unit price')],
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
      },
    );
  }
}

enum ProductOpt { update, delete }