import 'package:flutter/material.dart';

import 'package:fyp_final_project/categories/men_catergory.dart';
import 'package:fyp_final_project/categories/shoes_category.dart';
import 'package:fyp_final_project/categories/women_category.dart';



import 'package:fyp_final_project/widgets/fake_search.dart';


List<ItemsData> items=[


ItemsData(label:'Men'),
ItemsData(label:'Women'),
ItemsData(label:'Shoes'),
ItemsData(label:'Watches'),
ItemsData(label:'Shoes'),
ItemsData(label:'Hoodies'),


];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController=PageController();
@override
void initState() { 
  for (var element in items)
{
  element.isSelected=false;
}

setState(() {
  items[0].isSelected=true;
});

  super.initState();
  
}

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(


appBar: AppBar(
  
  
  elevation: 0,
  backgroundColor: Colors.white,
  title: const FakeSearch(),
  

  
  ),
body: Stack(children: [

Positioned(
  bottom: 0,left:0,child: sideNavigator(size)), 
  Positioned(
 bottom: 0, right:0,child:categview(size))

]),
    );
  }



Widget   sideNavigator(Size size ){
  return  SizedBox(height:size.height*0.8 , width:size.width*0.2,
  
   child: ListView.builder(
    
    itemCount: items.length,
    itemBuilder: (context,index){
return GestureDetector(

onTap: (){

_pageController.animateToPage(index, 
duration: const Duration(milliseconds: 100),curve: Curves.bounceInOut);

// for (var element in items)
// {
//   element.isSelected=false;
// }

setState(() {
  items[index].isSelected=true;
});

},


child: Container(
  color:items[index].isSelected==true? Colors.white:
    Colors.grey.shade300,
   
   height: 100, 
   child: Center(child: Text(items[index].label)))); 

   }),
   
   
   
   );



}
Widget categview(Size size )
{

  return Container(height: size.height*0.8 ,
  width: size.width*0.8, color: Colors.white,
  
  child: PageView(
controller: _pageController,

    onPageChanged: (value){

for (var element in items)
{
  element.isSelected=false;
}

setState(() {
  items[value].isSelected=true;
});


    },
    scrollDirection: Axis.vertical,
    children:const  [

MenCategory(),
WomenCategory(),
ShoesCategory(),
Center(child: Text('Watches category')),
Center(child: Text('Caps category')),

Center(child: Text('Hoodies category')),

  ]),
  
  
  
  );
}

}
class ItemsData
{
   String label;
   bool isSelected;
  ItemsData({required this.label, this.isSelected=false});
}