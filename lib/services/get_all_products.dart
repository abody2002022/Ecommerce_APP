import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProdctus() async {
    //request and response
    List<dynamic> data =
        await Api().get(Url: 'https://fakestoreapi.com/products');
    // دي كودresponse هنا بعمل لي ال
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
