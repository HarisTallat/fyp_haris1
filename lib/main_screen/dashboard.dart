import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_final_project/dashboard_components/balance.dart';
import 'package:fyp_final_project/dashboard_components/edit_business.dart';
import 'package:fyp_final_project/dashboard_components/manage_products.dart';
import 'package:fyp_final_project/dashboard_components/mystore.dart';
import 'package:fyp_final_project/dashboard_components/stats.dart';
import 'package:fyp_final_project/dashboard_components/supplier_order.dart';
import 'package:fyp_final_project/widgets/alert_dialog.dart';
import 'package:fyp_final_project/widgets/appbar_widgets.dart';
List<String> label =[
 'my store','orders','edit profile', 'manage products', 'balance', 'statics' 
];
List<IconData> icons=[
  Icons.store, Icons.shop_2_outlined, Icons.edit, Icons.settings, Icons.settings, Icons.attach_money, Icons.show_chart
];

List<Widget> pages= const [


MyStore(),
SupplierOrder(),
EditBusiness(),
ManageProducts(),
Balance(),
Stats(),

];

class DashboadScreen extends StatelessWidget {
  const DashboadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  
  title:const  AppBarTitle(title: 'Dashboard',),
actions: [IconButton(onPressed: (){
   MyAlertDialog.showMyDialog
(context: context, title: 'Log Out', content: 'Are you sure to log out? ', tabNo: (){

Navigator.pop(context);

},

tabYes: ()async {
               await FirebaseAuth.instance.signOut();
               Navigator.pop(context);
         // ignore: use_build_context_synchronously
         Navigator.pushReplacementNamed(context, '/welcome_Screen');
            },
);
}, icon:const  Icon (Icons.logout, color: Colors.black,))],
),
 body: Padding(
   padding: const EdgeInsets.all(25.0),
   child: GridView.count(
    
    
    mainAxisSpacing: 50,
    crossAxisSpacing: 50,
    crossAxisCount: 2, children: List.generate(6, (index) {
    return InkWell(


onTap: (){

Navigator.push(context, MaterialPageRoute(builder: (context)=> pages[index]));

},

      child: Card( 
    
        elevation: 20,
          shadowColor: Colors.purpleAccent.shade200, color: Colors.blueGrey.withOpacity(0.7), child: Column( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
     
     Icon(icons[index], color: Colors.yellowAccent, size: 50,),
     Text(label[index].toUpperCase(), style: const TextStyle(fontSize: 24,color: Colors.yellowAccent,
       fontWeight: FontWeight.w600, fontFamily: 'Acme', letterSpacing: 2),)
     
    
     
     
      ],), ),
    );
   }),),
 ),

    );
  }
}