import 'package:flutter/material.dart';
import 'package:fyp_final_project/widgets/appbar_widgets.dart';
class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  title:const AppBarTitle(title: 'WishList',) ,   leading: const AppBarBackButton(),)



    );
  }
}