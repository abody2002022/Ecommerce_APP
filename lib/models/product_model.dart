import 'dart:convert';

import 'package:flutter/material.dart';

//الكلاس دة عشان نخزن فية الداتا الي هترجع من الباك اند
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  // كونستراكتور بيشيل قيمة الداتا الي هترجع
  ProductModel(
      {required this.title,
      required this.id,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
  // بياخد الداتا factory constractor دة
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        title: jsonData['title'],
        id: jsonData['id'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rating: RatingModel.fromJson(jsonData['rating']) // خلي بالك هنا
        );
  }
}

//  عملنلها موديل لوحدهاmap هنا عشان دي
class RatingModel {
  final double rate;
  final int? id;
  RatingModel({required this.rate, required this.id});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], id: jsonData['id']);
  }
}
