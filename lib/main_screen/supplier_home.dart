import 'package:flutter/material.dart';
import 'package:fyp_final_project/main_screen/category.dart';
import 'package:fyp_final_project/main_screen/dashboard.dart';
import 'package:fyp_final_project/main_screen/home.dart';
import 'package:fyp_final_project/main_screen/stores.dart';




class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({super.key});

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex=0;
  final List<Widget>_tabs=const [
    HomeScreen(),
    CategoryScreen(),
     StoresScreen(),
      DashboadScreen(),
       Center(child: Text('Upload')),
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
       BottomNavigationBarItem(icon: Icon(Icons.dashboard),label:'Dashboard' ),
         BottomNavigationBarItem(icon: Icon(Icons.upload),label:'Upload' ),
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