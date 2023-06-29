import 'package:flutter/material.dart';

import 'package:veeki/utils/global.colors.dart';

import 'Product.dart';

class ProductsInHomePage extends StatefulWidget {
  ProductsInHomePage({Key? key}) : super(key: key);
  _ProductsInHomePageInHomePageState createState() => _ProductsInHomePageInHomePageState();
}

class _ProductsInHomePageInHomePageState extends State<ProductsInHomePage> {

  var list = [Product(text1:'Blood pressure checker',image: 'assets/22.jpg',text2: "10000",),Product(text1:'Posture Corrector For Men Women Back Brace Adjustable',text2:"5500",image: 'assets/322.jpg',),
Product(text1:"Massage Gun, Portable Handheld Electric Body Massager.", text2: "35000",image:"assets/massagegun.jpg")
];

 //    'Posture Corrector For Men Women Back Brace Adjustable','101 Detox ','Silky Shampoo','Hair Dryer','Black Gel'

  @override
  Widget build(BuildContext context){
    return
      Container(
        height: 140,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 0.0,bottom: 20.0,right: 8.0),
                child: InkWell(
                  onTap: (){
                  },
                  child:
                      Product(text1:list[index].text1 ,text2:list[index].text2 ,image: list[index].image,)

                  // Container(
                  //   padding: EdgeInsets.all(6),
                  //   // alignment: Alignment.center,
                  //   height: 170,
                  //   width:  150,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(6),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.2),
                  //         blurRadius: 5,
                  //         //blurStyle: BlurStyle.inner
                  //       )
                  //     ],
                  //   ),
                  //   child:
                  //   Column(
                  //     children: [
                  //       Expanded(
                  //         child: Image.asset(list[index].image,
                  //         ),
                  //       ),
                  //       SizedBox(height:8,),
                  //       Expanded(
                  //         child: SizedBox(
                  //           width: 130,
                  //           child: Text(
                  //
                  //             list[index].text1,
                  //             style: TextStyle(
                  //               color:  Colors.black87,
                  //               fontSize: 10.5,
                  //             ),
                  //               ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              );
            }
        ),
      );

  }

}
