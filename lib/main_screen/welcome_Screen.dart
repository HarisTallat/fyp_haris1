// ignore: file_names
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:fyp_final_project/widgets/yellow_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller; 
  bool processing =false;
  CollectionReference customers= FirebaseFirestore.instance.collection('customers');
  late String _uid;
  @override
void initState() { 
  _controller=AnimationController(vsync: this, duration: const Duration(seconds: 2));
  _controller.repeat();
  super.initState();
  
}

@override
  void dispose() {
  _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: Container(


decoration: const BoxDecoration(  image:
 DecorationImage(image:AssetImage('images/inapp/bgimage.jpg',),   fit: BoxFit.cover)),
 constraints:const  BoxConstraints.expand(),
 child: SafeArea(

   child: Column(
    
    
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:  [
 
AnimatedTextKit(
  animatedTexts: [ColorizeAnimatedText('WELCOME', textStyle: 
const TextStyle(fontSize: 45,  fontWeight: FontWeight.bold, fontFamily: 'Acme'),
colors: [Colors.yellow, Colors.red, Colors.blueAccent, Colors.green, Colors.purple]),

ColorizeAnimatedText('AR WARDROBE', textStyle: 
const TextStyle(fontSize: 45,  fontWeight: FontWeight.bold, fontFamily: 'Acme'),
colors: [Colors.yellow, Colors.red, Colors.blueAccent, Colors.green, Colors.purple]),




], isRepeatingAnimation: true, repeatForever: true,),
      const SizedBox(   height: 120, width:200, child: Image(image: AssetImage('images/inapp/logo.png')),),
    SizedBox(
      height: 60,
      child:DefaultTextStyle(
       style:  const TextStyle(fontSize: 45,  fontWeight: FontWeight.bold, fontFamily: 'Acme'),


        child: AnimatedTextKit(animatedTexts: [
          RotateAnimatedText('BUY'),
           RotateAnimatedText('SHOP'),
            RotateAnimatedText('AR Wardrobe'),
          
        ],
        repeatForever: true,),
      ),
    ),
  Column(
    children: [
      Container(decoration:  BoxDecoration(color:Colors.white38,
      borderRadius: BorderRadius.circular(25)),
       
       
       child: const Padding(
         padding:  EdgeInsets.all(12.0),
         child: Text('Supplier Only', style: TextStyle(fontSize: 26, color: Colors.yellowAccent, fontWeight: FontWeight.w600),),
       ),
       ),
          const SizedBox(

    height: 10,
   ),
  Container(
    height: 60,
   
    decoration:  BoxDecoration(color:Colors.white38,
   borderRadius: BorderRadius.circular(20)),
   
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [


AnimatedLogo(controller: _controller),
YellowButton(label: 'Log In' , width: 0.25, onPressed: (){

Navigator.pushReplacementNamed(context, '/supplier_login');

}),
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: YellowButton(label: 'Sign Up ', width: 0.25, onPressed:(){

Navigator.pushReplacementNamed(context, '/supplier_signup');

   }),
 )

   ]),
   ),

    ],
  ), 
Column(
    children: [
      Container(decoration:  BoxDecoration(color:Colors.white38,
      borderRadius: BorderRadius.circular(25)),
       
       
       child: const Padding(
         padding:  EdgeInsets.all(12.0),
         child: 
         Text('Customers Only', style: TextStyle(fontSize: 26, color:
          Colors.yellowAccent, fontWeight: FontWeight.w600),),
       ),
       ),
          const SizedBox(

    height: 10,
   ),
   Container(
    height: 60,
   
    decoration:BoxDecoration(color:Colors.white38,
   borderRadius: BorderRadius.circular(20)),
   
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
Padding(
  padding: const EdgeInsets.only(left: 8),
  child:   YellowButton(label: 'Log In' , width: 0.25, onPressed: (){
    Navigator.pushReplacementNamed(context, '/customer_login');
  }),
),
  YellowButton(label: 'Sign Up ', width: 0.25, onPressed:(){
     Navigator.pushReplacementNamed(context, '/customer_signup');
  }),

 AnimatedLogo(controller: _controller),

   ]),
   ),
     const SizedBox(

    height: 10,
   ),
   Padding(
     padding: const EdgeInsets.symmetric(vertical: 1),
     child: Container(
      height: 90,
   
   decoration:  BoxDecoration( color: Colors.white30.withOpacity(0.3)),
   child: Row(
     
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
   
   GoogleFacebookLogin(
   
     label: 'Google',
     onpressed: (){},
     child: const Image(image: AssetImage('images/inapp/google.jpg')),
   ),
   GoogleFacebookLogin(
   
     label: 'Facebook',
     onpressed: (){},
     child: const Image(image: AssetImage('images/inapp/facebook.jpg')),
   ),
  processing==true? const CircularProgressIndicator(): GoogleFacebookLogin(
   
     label: 'Guest',
     onpressed: ()async{
      setState(() {
        processing= true;
      });
      await FirebaseAuth.instance.signInAnonymously().whenComplete(()  async { 
        
        _uid=FirebaseAuth.instance.currentUser!.uid;
        await customers.doc(_uid).set({


'name': '', 'email':'','profileimage':'','phone':'','address':'','cid':_uid,


   });});
      

      Navigator.pushReplacementNamed(context, '/customer_home');
     },
     child: const Icon(Icons.person, size: 55, color: Colors.lightBlueAccent,)
   )
   
   ],)
   
     ),
   )
 
   ],
   
 ),
 
 ]),


),
),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return     AnimatedBuilder(
    
    
    
      animation: _controller.view,
    
      builder: (context, child){
    
        return Transform.rotate(angle: _controller.value*2*pi, child: child,);
    
      },
    
      child:   const 
    
      
    
      Image(image: AssetImage('images/inapp/rotate.png')),
    
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onpressed;
  final Widget child;

  const GoogleFacebookLogin({
    super.key, required this.child, required this.onpressed, required this.label
  });

  @override
  Widget build(BuildContext context) {
    return     Padding(
    
      padding: const EdgeInsets.symmetric(vertical: 8),
    
      child:   SingleChildScrollView(
    
        child: InkWell(
    
    
    
          onTap: onpressed,
    
          child: Column(
    
          
    
          
    
          
    
            children:  [SizedBox( height: 50, width:50, 
    
          
    
              child: child),
    
          
    
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 18),)
    
          
    
            
    
          
    
            
    
          
    
            ],
    
          
    
          ),
    
        ),
    
      ),
    
    );
  }
}