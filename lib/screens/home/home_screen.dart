
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/providers/product_provider.dart';
import 'package:food_delivery/screens/home/single_product.dart';
import 'package:food_delivery/screens/Product_overview/product_overview.dart';
import 'package:provider/provider.dart';
import '../search/search_product.dart';
import 'drawer_side.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ProductProvider productProvider;
  Widget _FruitProduct(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fruits"),
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchProduct(search: productProvider.getFruitProductDataList)));
                  },
                  child: Text("View all"))
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFruitProductDataList.map((FruitProductData){
             return  SingleProduct(ProductImage: FruitProductData.productImage, ProductName: FruitProductData.productName,ProductPrice:FruitProductData.productPrice  ,onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductOverview(ProductImage: FruitProductData.productImage, ProductName: FruitProductData.productName, ProductPrice: FruitProductData.productPrice,)));
              },);
            }).toList()
          ),
        ),
      ],
    );

  }

  Widget _VegetableProduct(context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vegetables"),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchProduct(search: productProvider.getVegetableProductDataList)));
                    },
                    child: Text("View all"))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:  productProvider.getVegetableProductDataList.map((VegetableProductData){
                return  SingleProduct(ProductImage: VegetableProductData.productImage, ProductName: VegetableProductData.productName,ProductPrice:VegetableProductData.productPrice  ,onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductOverview(ProductImage: VegetableProductData.productImage, ProductName: VegetableProductData.productName, ProductPrice: VegetableProductData.productPrice,)));
                },);
              }).toList()
            ),
          ),
        ]
    );
  }

  Widget _PoultryProduct(context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Poultry"),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchProduct(search: productProvider.getPoultryProductDataList)));
                    },
                    child: Text("View all"))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productProvider.getPoultryProductDataList.map((PoultryProductData){
                return  SingleProduct(ProductImage: PoultryProductData.productImage, ProductName: PoultryProductData.productName,ProductPrice:PoultryProductData.productPrice  ,onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductOverview(ProductImage: PoultryProductData.productImage, ProductName: PoultryProductData.productName, ProductPrice: PoultryProductData.productPrice,)));
                },);
              }).toList()
            ),
          ),
        ]
    );
  }

 @override
  void initState() {
    ProductProvider productProvider =Provider.of(context , listen: false);
    productProvider. getFruitProductData();
    productProvider.getVegetableProductData();
    productProvider.getPoultryProductData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    productProvider =Provider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffcbcbcb),
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Home"),
          actions: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd6382),
                child: IconButton(icon : Icon(Icons.search , size: 17, color: Colors.black,),
                  onPressed: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchProduct()));
                  },
            )),
             Padding(padding: EdgeInsets.symmetric(horizontal: 5),
             child: CircleAvatar(
               radius: 12,
               backgroundColor: Colors.amberAccent,
               child: Icon(Icons.shopping_cart_checkout , size: 17, color: Colors.black,) ,
             ),
             ),
          ],
        ),
        drawer: DrawerSide(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/homeimage.png"),),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red
                ),
               child: Row(
                 children: [
                   Expanded(
                       flex:2,
                       child: Container(
                     child: Column(
                       children: [
                         Padding(padding: EdgeInsets.only(right: 130 , bottom: 10),
                         child: Container(
                           height: 50,
                           width: 100,
                           decoration: BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) , bottomRight:Radius.circular(50) )
                           ),
                           child: Center(
                             child: Text("Foodie", style: TextStyle(
                               color: Colors.greenAccent
                             ),),
                           ),
                         ),
                         ),
                         Text("30% Off"),
                         Padding(padding: EdgeInsets.only(left: 20),
                         child: Text("On all Food Product"))
                       ],
                     ),
                   )),
                   Expanded(child: Container()),
                 ],
               ),
              ),
              _PoultryProduct(context),
              _VegetableProduct(context),
              _FruitProduct(context)
            ],
          ),
        ),

      ),
    );
  }
}
