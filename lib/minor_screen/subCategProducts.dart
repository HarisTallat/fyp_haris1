import 'package:flutter/material.dart';
import 'package:fyp_final_project/widgets/appbar_widgets.dart';
class SubCategProducts  extends StatelessWidget {
  final String subcategName;
  final String mainCategName;
  const SubCategProducts ({super.key, required this.subcategName, required this.mainCategName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
  
  
  elevation: 0,
  backgroundColor: Colors.white,
  leading: const AppBarBackButton(),
  
  
  
  title: AppBarTitle(title: subcategName),
),
body: Center(child: Text(mainCategName)),

    );
  }
}
