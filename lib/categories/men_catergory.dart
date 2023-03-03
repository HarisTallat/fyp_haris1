import 'package:flutter/material.dart';

import 'package:fyp_final_project/utilities/categ_list.dart';
import 'package:fyp_final_project/widgets/categ_widgets.dart';

List<String> imagetry=[
'images/try/men0.jpeg',
'images/try/men1.jpeg',
'images/try/men2.jpeg',
'images/try/men3.jpeg',

];

List<String> labeltry=[


'Shirt',
'Pants',
'Shirt',
'Pants',

];
class MenCategory extends StatelessWidget {
  const MenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children:[ Positioned(
      
          bottom: 0,
          left: 0,
          child: SizedBox(
      
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.75,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                
                
                
               const  CategoryHeaderLabel(headerLabel: 'Men',),
                SizedBox(
              
              
                height: MediaQuery.of(context).size.height*0.68,
                child: GridView.count(
              
              mainAxisSpacing: 70,
              crossAxisSpacing: 15,
              crossAxisCount: 3, children: List.generate(men.length, (index) {
                
                
                return SubCategModel(mainCategName: 'Men',subCategName:men[index],
                assetName: 'images/men/men$index.jpg',
                subcategLabel: men[index],);
                
                }),)
                )
                
                ],
                
              ),
            ),
          ),
          
        ),
         const  Positioned(
            bottom: 0,
            right: 0,
          child: SliderBar(mainCategName: 'Men',),
         )
        ],
      
      ),
    );
    
    
  }
}
