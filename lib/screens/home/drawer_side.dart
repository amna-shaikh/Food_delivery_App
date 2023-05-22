import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/Review_cart/review_cart.dart';
import 'package:food_delivery/screens/my_profile/my_profile.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);
  Widget listTiles({required IconData icon , required String title , required VoidCallback onTap}){
    return ListTile(
      onTap: onTap,
      leading: Icon(icon , size: 32,),
      title: Text(title),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amberAccent,
        child: ListView(
          children: [
            DrawerHeader(child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 43,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.amberAccent,
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome guest"),
                    SizedBox(height: 7,),
                    Container(
                      height: 30,
                      child: OutlinedButton(
                        onPressed: (){}, child: Text("Login"),
                        style:OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                                width: 2 ),
                          ),
                        ),
                      ),
                    ),
                  ],),
              ],),
            ),
            listTiles(icon: Icons.home, title: 'Home' , onTap: (){}),
            listTiles(icon: Icons.add_shopping_cart_outlined, title: 'Cart' , onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewCart()));
            }),
            listTiles(icon: Icons.person, title: 'Profile' , onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfile()));
            }),
            listTiles(icon: Icons.notification_important_sharp, title: 'Notification' , onTap: (){}),
            listTiles(icon: Icons.star, title: 'Rating & Reviews' , onTap: (){}),
            listTiles(icon: Icons.favorite, title: "Wishlist" , onTap: (){}),
            listTiles(icon: Icons.content_copy_outlined, title: 'Complaint' , onTap: (){}),
            listTiles(icon: Icons.format_quote_outlined, title: 'FAQs' , onTap: (){}),

            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Contact"),
                      Text("0336-2346710")
                    ],
                  ),
                  SizedBox(height: 5,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Email"),
                        Text("amnashaikh090@gmail.com")
                      ],
                    ),
                  ),


                ],
              ),

            )
          ],
        ),
      ),

    );
  }
}
