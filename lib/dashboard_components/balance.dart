import 'package:flutter/material.dart';
import 'package:fyp_final_project/widgets/appbar_widgets.dart';
class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  title:const AppBarTitle(title: 'Your Balance',) ,   leading: const AppBarBackButton(),)



    );
  }
}