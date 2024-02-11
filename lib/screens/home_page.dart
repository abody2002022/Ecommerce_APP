import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/costum_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "New Trend",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsServices().getAllProdctus(),
                builder: (context, Snapshot) {
                  // if (Snapshot.hasData) {
                  List<ProductModel> Products = Snapshot.data!;
                  return GridView.builder(
                      itemCount: Products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //عدد العواميد علي الاسكرين
                        crossAxisCount: 2,
                        //بيتحكم في النسبة ما بين العرض لي الطول
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: Products[index],
                        );
                      });
                  /*} else {
                    return Center(child: CircularProgressIndicator());
                  }*/
                })));
  }
}
