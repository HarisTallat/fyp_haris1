
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fyp_final_project/widgets/auth_widgets.dart';
import 'package:fyp_final_project/widgets/snackBar.dart';


class CustomerLogin extends StatefulWidget {
  const CustomerLogin({super.key});

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
 

  late String name;
  late String email;
  late String  password;
  late String profileImage;
  late String _uid;
  bool processing = false;

final GlobalKey<FormState>_formKey= GlobalKey<FormState>();
final GlobalKey<ScaffoldMessengerState>_scaffoldKey= GlobalKey<ScaffoldMessengerState>();


  bool passwordVisible = false;
  

void logIn() async
{
setState(() {
  processing=true;
});

  
    if(_formKey.currentState!.validate()){
      

try{ await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

 _formKey.currentState!.reset();

     Navigator.pushReplacementNamed(context, '/customer_home');
 
 }on FirebaseAuthException catch (e){

  if(e.code=='user-not-found')
 {
  setState(() {
  processing=false;
});
   MyMessage. showSnackBar(_scaffoldKey,' No user found for that email');
   }
 
 else if(e.code=='Wrong-password')
 {
    setState(() {
  processing=false;
});
   MyMessage. showSnackBar(_scaffoldKey,' Wrong password provided for the user ');

 }
 }

      }
        
    else {
      setState(() {
  processing=false;
});
  MyMessage. showSnackBar(_scaffoldKey,'Please Fill all Fields');
    }
    
}

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(

      key: _scaffoldKey,
      child: Scaffold(
    
    
    body: SafeArea(
      child:   Center(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      
        reverse: true,
      
        child:   Padding(
          padding: const EdgeInsets.all(16.0),
      
          child:   Form(
            key:_formKey,
            child: Column(  
              
          
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
      
              const   AuthHeaderLabel(headerLabel: 'Log In',),
              const SizedBox(
                height: 50,
              )
      ,
              
  
 
                 Padding(
     padding: const EdgeInsets.symmetric(vertical: 10),
 
                   child: TextFormField(
                   
                validator: (value){
          
          if(value!.isEmpty){
          
          
            return 'Please Enter Email Address';
          
          }  
          else if(value.isValidEmail()==false)
          {
            return 'Invalid Email';
          }
          else if(value.isValidEmail()==true){
            
            return null;
          }
          return null;
          
                     },  
                            onChanged: (value){
    
    email=value;
    
    
                     },
                    //  controller:_emailcontroller,    
                    
                    keyboardType: TextInputType.emailAddress,
                      decoration: textFormDecoration.copyWith(
                      labelText: 'Email Address', hintText: 'Enter your Email Address ')),
     
              
                 ),
   
                 Padding(
              
            padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField( 
                    
                    
                    
                      validator: (value){
          
          if(value!.isEmpty){
          
          
            return 'Please Enter your Password';
          
          }  
          return null;
          
                     },
                            onChanged: (value){
    
    password=value;
    
    
    
                     },
                     // controller: _passwordcontroller,
                    obscureText: passwordVisible, decoration:textFormDecoration.copyWith(
          
                    suffixIcon: IconButton(onPressed: (){
          
          
          setState(() {
            passwordVisible=!passwordVisible;
          });
          
                    }, icon:   Icon(  
                       passwordVisible? Icons.visibility: Icons.visibility_off, color: Colors.pinkAccent) ),
                      labelText: 'Password', hintText: 'Enter your Password ')),
              
 
              
                 ),
                 TextButton(onPressed: (){}, child: const Text('Forget Password?',   style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),)), 
    
                 HaveAccount( haveAccount: 'Don\'t have account? ', actionLabel: 'Sign Up', onPressed: (){



Navigator.pushReplacementNamed(context, '/customer_signup');

                 },),
              
        
       processing==true? const Center(child: CircularProgressIndicator())  :   AuthMainButton( mainButtonLabel: ' Log In', onPressed: () {
              logIn();
    
    
    
            },)
                           
            ]),
          ),    
        ),    
      ),
      ),
    ),
     ),
    );
  }
}

