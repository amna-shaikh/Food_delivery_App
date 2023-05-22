import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

import '../../widgets/single_item.dart';
class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text("Rs . 1700.0", style: TextStyle(color: Colors.green[700]),),
        trailing: Container(
          width: 160,
          child: MaterialButton(onPressed: (){} , child: Text("check out"),
          color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Review Cart" , style: TextStyle(color: textColor , fontSize: 18),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
        //  SingleItem(true),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
