import 'package:flutter/material.dart';

void snackBarMsg(BuildContext context, String title){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(title)));
}