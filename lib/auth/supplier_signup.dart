// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fyp_final_project/widgets/auth_widgets.dart';
import 'package:fyp_final_project/widgets/snackBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SupplierRegister extends StatefulWidget {
  const SupplierRegister({super.key});

  @override
  State<SupplierRegister> createState() => _SupplierRegisterState();
}

class _SupplierRegisterState extends State<SupplierRegister> {
 

  late String storeName;
  late String email;
  late String  password;
  late String storelogo;
  late String _uid;
  bool processing = false;

final GlobalKey<FormState>_formKey= GlobalKey<FormState>();
final GlobalKey<ScaffoldMessengerState>_scaffoldKey= GlobalKey<ScaffoldMessengerState>();


  bool passwordVisible = false;
   final ImagePicker _picker =ImagePicker();
XFile? _imageFile;
dynamic _pickedImageError;
CollectionReference supplier= FirebaseFirestore.instance.collection('supplier');


void _pickImageFromCamera()async{
  try{ final pickedImage = await _picker.
  pickImage(source: ImageSource.camera, maxHeight: 300, maxWidth: 300, imageQuality: 95);
  setState(() {
    
    _imageFile=pickedImage;
  });} catch(e){


    setState(() {
      _pickedImageError=e;
    });
    print(_pickedImageError);
  }
 
}

void _pickImageFromGallery()async{
  try{ final pickedImage = await _picker.
  pickImage(source: ImageSource.gallery, maxHeight: 300, maxWidth: 300, imageQuality: 95);
  setState(() {
    
    _imageFile=pickedImage;
  });} catch(e){


    setState(() {
      _pickedImageError=e;
    });
    print(_pickedImageError);
  }
 
}


void signUp() async
{
setState(() {
  processing=true;
});

  
    if(_formKey.currentState!.validate()){
      if(_imageFile!=null){

try{ await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);


firebase_storage.Reference ref = 
firebase_storage.FirebaseStorage.instance.ref('supp-images/$email.jpg');
await ref.putFile(File(_imageFile!.path));
_uid= FirebaseAuth.instance.currentUser!.uid;
  storelogo =  await ref.getDownloadURL();
    await supplier.doc(_uid).set({


'storename': storeName,
 'email':email,'storelogo':storelogo,'phone':'','address':'','sid':_uid, 'cover_image':'',


   });




 _formKey.currentState!.reset();
 setState(() {
   
   _imageFile=null;
 });
     Navigator.pushReplacementNamed(context, '/supplier_login');
 
 }on FirebaseAuthException catch (e){if (e.code == 'weak-password') {
setState(() {
  processing=false;
});
      MyMessage. showSnackBar(_scaffoldKey,'The password provided is too weak. ');
  } else if (e.code == 'email-already-in-use') {
setState(() {
  processing=false;
});

  
        MyMessage. showSnackBar(_scaffoldKey,'The account already exists for that email.');
    
  }}

      }
      else{
        setState(() {
  processing=false;
});
        
  MyMessage. showSnackBar(_scaffoldKey,'Please pick an image first ');
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
              
          
              
              children:  [
      
              const   AuthHeaderLabel(headerLabel: 'Sign Up',),
      
                 Row(
         
            children: [
     
            Padding(
              

                padding: const  EdgeInsets.symmetric( vertical: 20, horizontal: 40),
              
         
                child: 
                CircleAvatar(radius: 60, 
                backgroundColor: Colors.pinkAccent,backgroundImage: _imageFile==null? null : FileImage(File(_imageFile!.path)),),
    
              
              ),
  
              Column(children: [
    
            Container(decoration:  const BoxDecoration(color: Colors.pinkAccent, 
   
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), 

            topRight: Radius.circular(15))),
     
            child: IconButton(icon:const  Icon(Icons.camera_alt, color: Colors.white,), 
              
    
            onPressed: (){
              
           
              
         _pickImageFromCamera();
              
      
              
            },),
      
              
            ),
  
              
            const SizedBox(height: 6,), 
       
              
            Container(decoration:  const BoxDecoration(color: Colors.pinkAccent, 
   
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), 
  
            bottomRight: Radius.circular(15))),
              
    
            child: IconButton(icon:const  Icon(Icons.photo, color: Colors.white,), 
              
        
              
            onPressed: (){
              
  
          _pickImageFromGallery();
              
     
            },),
              
           
              
            )
              
          
              ],)
      
              
            ],
  
              
                 ),
  
                 Padding(
              

                   padding: const EdgeInsets.symmetric(vertical: 10),
              

                   child: TextFormField(
                     validator: (value){
          
          if(value!.isEmpty){
          
          
            return 'Please Enter your Full Name';
          
          }  
          return null;
          
                     },
                     onChanged: (value){
    
    storeName=value;
    
    
                     },
                   //  controller: _namecontroller,
                    decoration: textFormDecoration.copyWith(
                      
                      labelText: 'Full Name', hintText: 'Enter your Full Name ') ),
  
              
                 ),
 
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
    
                 HaveAccount( haveAccount: 'Already have account? ', actionLabel: 'Log IN', onPressed: (){

Navigator.popAndPushNamed(context, '/customer_login');

                 },),
              
        
       processing==true? const CircularProgressIndicator(color: Colors.pinkAccent)  :   AuthMainButton( mainButtonLabel: ' Sign UP', onPressed: () {
              signUp();
    
    
    
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

