import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
enum signchar{fill , outline}
class ProductOverview extends StatefulWidget {
 final String ProductName;
 final String ProductImage;
 final int ProductPrice;
   ProductOverview({
    required this.ProductName , required this.ProductImage, required this.ProductPrice
});
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}
class _ProductOverviewState extends State<ProductOverview> {

  signchar _character = signchar.fill;
  Widget bottomNavigatorbar({required Color iconColor ,
    required Color backgroundColor  ,
    required Color color ,
    required String title ,
    required IconData iconData}){
return Expanded(child: Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(iconData ,size: 17, color: iconColor,),
      SizedBox(width: 5,),
      Text(title, style: TextStyle(color: color),)
    ],
  ),
));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorbar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add to WishList",
            iconData: Icons.favorite_border
          ),
          bottomNavigatorbar(
              backgroundColor: primaryColor,
              color:textColor,
              iconColor: Colors.white70,
              title: "Go to Cart",
              iconData: Icons.shopping_cart_checkout
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: textColor,
        ),
        title: Text("Product Overview" , style: TextStyle(color: textColor),),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.ProductName ?? ""),
                      subtitle: Text("\$${widget.ProductPrice}"),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(widget.ProductImage ?? ""),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text("Available options" , textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10) ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 3, backgroundColor: Colors.green,),
                              Radio(
                                value: signchar.fill,
                                groupValue: _character,
                                onChanged: (value){
                                  setState(() {
                                    _character = value!;
                                  });
                                },
                                activeColor: Colors.green[700],)
                            ],
                          ),
                          Text("\&50"),
                          /*Container(
                            padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add , size:17 , color: primaryColor,),
                                Text("Add", style: TextStyle(color: primaryColor),
                                )
                              ],
                            ),
                          )*/
                        ],
                      ),
                    )

                  ],
                ),
              )),
          Expanded(child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About this Product" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Text("About this Product" , style: TextStyle(fontSize: 16 , color: textColor),),

              ],
            ),
          ))
          
        ],
      ),
    );
  }
}
