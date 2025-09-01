class Product{
  late String id;
  late String name;
  late int code;
  late String img;
  late int quantity;
  late int unitPrice;
  late int totalPrice;

  Product.fromJson(Map<String, dynamic> productJson){

    id = productJson['_id'];
    name = productJson['ProductName'];
    code = productJson['ProductCode'];
    img = productJson['Img'];
    quantity = productJson['Qty'];
    unitPrice = productJson['UnitPrice'];
    totalPrice = productJson['TotalPrice'];

  }
}