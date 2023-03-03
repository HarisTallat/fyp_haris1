import 'package:flutter/material.dart';

import 'package:fyp_final_project/widgets/fake_search.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController (
      length:4,
      child: Scaffold(
    
        appBar:AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch(),
          
          
          bottom: const TabBar(
           // isScrollable: true,
           indicatorColor: Colors.yellow,
           indicatorWeight: 8,
            tabs: 
           [
            RepeatedTab(label: 'Men'),
           RepeatedTab(label: 'Women'),
           RepeatedTab(label: 'Watches'),
            RepeatedTab(label: 'Caps'),
           
           
           ],)
          
           ,),
           
           body: const TabBarView(children: [
            Center(child: Text('Men Screen')),
            Center(child: Text('Women Screen')),
            Center(child: Text('Watch Screen')),
            Center(child: Text('Cap Screen')),
           ],)
      ),
    );
  }
}


class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({
    super.key,required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Tab(child:
     Text(label,style:TextStyle(color: Colors.grey.shade600)),);
  }
}