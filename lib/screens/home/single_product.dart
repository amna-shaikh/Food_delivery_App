import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String ProductImage;
  final String ProductName;
  final int ProductPrice;
  final  VoidCallback onTap;
  const SingleProduct({required this.ProductImage , required this.ProductName , required this.onTap , required this.ProductPrice});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:[ Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffd9dad9)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child:Image.network(ProductImage),
                  ),
                ),
                /* Expanded(
              flex: 2,
              child: Image.asset("assets/pizza.jpg"),
            ),*/
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ProductName),
                          Text("Rs. ${ProductPrice} "),
                          SizedBox(height: 5,),
                          Row(children: [
                            Expanded(child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey
                                  )
                              ),
                              child: Row(
                                children: [
                                  Expanded(child:Text("50 gram" , style: TextStyle(fontSize: 10),)
                                  ),
                                  Center(
                                    child: Icon(Icons.arrow_drop_down_sharp, size: 20,),
                                  )
                                ],
                              ),
                            ),
                            ),
                            SizedBox(width: 5,),
                            Expanded(child:
                            Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.grey
                                  )
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.remove , size: 15,),
                                  Text("1"),
                                  Icon(Icons.add ,size: 15,)
                                ],
                              ),
                            ),
                            ),
                          ],),
                        ],
                      ),
                    )
                ),
              ],
            ),

          ),
          ]),
    );
  }
}
