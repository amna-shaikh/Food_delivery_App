
import 'package:flutter/material.dart';

import '../constants/colors.dart';
class SingleItem extends StatelessWidget {

  bool iscart = false;
  String productName;
  String productImage;
  int productPrice;
  SingleItem({  required this.iscart , required this.productImage , required this.productName,required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(child: Container(height: 100, child: Center(child: Image.network(productImage),),)),
            Expanded(child: Container(height: 100,child: Column(
              mainAxisAlignment: iscart == false ?MainAxisAlignment.spaceAround : MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(productName , style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
                    Text("Rs. ${productPrice}" , style: TextStyle(color: Colors.grey,),)
                  ],
                ),
              iscart == false ? Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      Expanded(child:   Text("50 gram" , style: TextStyle(color: Colors.grey,fontSize: 14),)),
                      Center(
                        child: Icon(Icons.arrow_drop_down_outlined , size: 20, color: primaryColor,),
                      )
                    ],
                  ),
                ): Text("50 gram")
              ],
            ),)),
            Expanded(child: Container(
              padding:iscart == false? EdgeInsets.symmetric(horizontal: 15, vertical: 30) : EdgeInsets.only(left: 15, right: 15),
              height: 100,
            child:iscart == false? Container(height: 25,width: 50,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add , color: primaryColor, size: 20,),
                    Text("Add" , style: TextStyle(color: primaryColor,fontSize: 14),)
                  ],
                ),
              ),

            ):Column(
              children: [
                Icon(Icons.delete, size: 30 ,color: Colors.black54,),
                Container(height: 25,width: 70,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add , color: primaryColor, size: 20,),
                        Text("Add" , style: TextStyle(color: primaryColor,fontSize: 14),)
                      ],
                    ),
                  ),
                )
              ],
            )
            )),

          ],
        ),

      ),
        iscart==false? Container():Divider(
          height: 1,
          color: Colors.black45,
        )
    ]);
  }
}
