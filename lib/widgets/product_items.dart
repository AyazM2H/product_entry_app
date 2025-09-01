import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:productlist/models/product.dart';
import 'package:productlist/screens/update_product.dart';
import 'package:productlist/utils/urls.dart';


class ProductItems extends StatefulWidget {
  const ProductItems({
    super.key, required this.product, required this.refreshProductList,
  });

  final Product product;
  final VoidCallback refreshProductList;

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {

  Future<void> _deleteProductInfo() async{

    Uri uri = Uri.parse(Urls.deleteProductUrl(widget.product.id));

    Response response = await get(uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);


    if(response.statusCode == 200){
      widget.refreshProductList();
    }

  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: ListTile(
        leading: Image.network(
          width: 40,
            widget.product.img,
            errorBuilder: (_, __, ___){
              return Icon(Icons.error_outline, size: 40,);
            },
          ),
        title: Text(widget.product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Code: ${widget.product.code}'),
            Text('Quantity: ${widget.product.quantity}'),
            Text('Unit price ${widget.product.unitPrice}')
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  UpdateProduct(product: widget.product,
              )),);
            }else{
              _deleteProductInfo();
            }
          },
        ),
      ),
    );
  }
}

enum ProductOpt { update, delete }