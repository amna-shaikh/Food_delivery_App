import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
Widget SingleProduct(){
  return  Container(
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
        Expanded(
          flex: 2,
          child: Image.network("https://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg?w=2000"),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("pizza"),
                  Text("50/gram"),

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


  );
}
  @override
  Widget build(BuildContext context) {
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
              backgroundColor: Colors.amberAccent,
                child: Icon(Icons.search , size: 17, color: Colors.black,)
            ),
             Padding(padding: EdgeInsets.symmetric(horizontal: 5),
             child: CircleAvatar(
               radius: 12,
               backgroundColor: Colors.amberAccent,
               child: Icon(Icons.shopping_cart_checkout , size: 17, color: Colors.black,) ,
             ),
             ),
          ],
        ),
        drawer: Drawer(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(image:NetworkImage("https://nextrestaurants.com/wp-content/uploads/2019/10/Restaurant-Instagram-Photography.png"),),
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
              Padding(padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Herbs Seasoning "),
                  Text("View all")
                ],
              ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                   SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct()
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Herbs Seasoning "),
                    Text("View all")
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct()
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
