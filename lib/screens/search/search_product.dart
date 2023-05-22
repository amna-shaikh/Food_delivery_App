import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/single_item.dart';

import '../../Models/product_model.dart';
class SearchProduct extends StatefulWidget {

  final List<ProductModel>search ;
  SearchProduct({Key? key , required this.search});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(padding: EdgeInsets.all(8.0) ,
          child: Icon(Icons.menu),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),

          ),
          Container(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: 'search for items in store',
                suffixIcon: Icon(Icons.search)
              ),

            ),
          ),
          SizedBox(height: 10,),
          Column(
            children: widget.search.map((data){
              return SingleItem(iscart: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,

              );
            }).toList(),
          )


        ],
      ),
    );
  }
}
