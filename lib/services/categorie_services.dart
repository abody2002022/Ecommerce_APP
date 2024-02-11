import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(Url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> prodcutsList = [];
    for (int i = 0; i < data.length; i++) {
      prodcutsList.add(ProductModel.fromJson(data[i]));
    }
    return prodcutsList;
  }
}
