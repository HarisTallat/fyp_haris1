import 'package:flutter/material.dart';
import 'package:fyp_final_project/auth/customer_login.dart';
import 'package:fyp_final_project/auth/customer_signup.dart';
import 'package:fyp_final_project/auth/supplier_login.dart';
import 'package:fyp_final_project/auth/supplier_signup.dart';
import 'package:fyp_final_project/main_screen/customer_home.dart';
import 'package:fyp_final_project/main_screen/supplier_home.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:fyp_final_project/main_screen/welcome_Screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  
  
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
   //
   //   home:WelcomeScreen(),
   initialRoute: '/welcome_Screen',
      routes: {
        '/welcome_Screen':(context)=>const WelcomeScreen(),
         '/customer_home':(context)=>const CustomerHomeScreen(),
          '/supplier_home':(context)=>const SupplierHomeScreen(),
          '/customer_signup':(context)=>const CustomerRegister(),
           '/customer_login':(context)=>const CustomerLogin(),
            '/supplier_signup':(context)=>const SupplierRegister(),
           '/supplier_login':(context)=>const SupplierLogin(),
          

      },

    );
  }
}
 

