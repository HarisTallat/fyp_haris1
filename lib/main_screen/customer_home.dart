import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_final_project/main_screen/cart.dart';
import 'package:fyp_final_project/main_screen/category.dart';
import 'package:fyp_final_project/main_screen/home.dart';
import 'package:fyp_final_project/main_screen/profile.dart';
import 'package:fyp_final_project/main_screen/stores.dart';




class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex=0;
  final List<Widget>_tabs= [
   const HomeScreen(),
   const CategoryScreen(),
   const  StoresScreen(),
   const    CartScreen(),
        ProfileScreen(documentId: FirebaseAuth.instance.currentUser!.uid,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:_tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
    type:BottomNavigationBarType.fixed,
    selectedLabelStyle:const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items:const
       [
      BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home', backgroundColor: Colors.red ),
       BottomNavigationBarItem(icon: Icon(Icons.search),label:'Category' ),
       BottomNavigationBarItem(icon: Icon(Icons.shop),label:'Stores' ),
       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'Cart' ),
         BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile' ),
       ],
       onTap:(index){
        setState(() {
          _selectedIndex=index;
          
        });
       }
       
       
       ),


    );
  }
}