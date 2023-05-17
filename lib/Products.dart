import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/HomePage.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/BottomNavBar.dart';
import 'package:spa/widgets/CardButton.dart';
import 'package:spa/widgets/Profile.Buttons.dart';
import 'package:spa/widgets/back.button.global.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
  Products ({Key? key,}) : super (key: key);
}

class _ProductsState extends State<Products> {
  var list = ['Growing Oil','Cut Shampoo','Perfume Shampoo','Mani Shampoo','Silky Shampoo','Hair Dryer','Black Gel'];
  var Price = "\$65";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButtonGlobal(
                            widget: HomePage(),
                          ),
                          Text("Products",
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.search_outlined,size: 25,),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  child: GridView.builder(
                      itemCount: list.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.7
                      ),
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0,top: 0.0,bottom: 0.0,right: 8.0),
                              child: InkWell(
                                onTap: (){
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  // alignment: Alignment.center,
                                  height: 220,
                                  width:  100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 5,
                                        //blurStyle: BlurStyle.inner
                                      )
                                    ],
                                  ),
                                  child:
                                  Column(
                                    children: [
                                      FittedBox(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.asset("Images/Products.png",
                                          ),
                                        ),
                                      ),
                                      SizedBox(height:8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index],
                                            style: TextStyle(
                                              color:  Colors.black87,
                                              fontSize: 10.5,
                                            ),
                                          ),
                                          Text(
                                            Price,
                                            style: TextStyle(
                                              color:  Colors.black87,
                                              fontSize: 10.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
            //     Container(
            //       child: ListView.builder(
            //       scrollDirection: Axis.vertical,
            //       itemCount: list.length,
            //       itemBuilder: (context, index){
            //         return Padding(
            //           padding: const EdgeInsets.only(left: 20.0,top: 0.0,bottom: 0.0,right: 8.0),
            //           child: InkWell(
            //             onTap: (){
            //             },
            //             child: Container(
            //               padding: EdgeInsets.all(6),
            //               // alignment: Alignment.center,
            //               height: 220,
            //               width:  100,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(6),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.black.withOpacity(0.2),
            //                     blurRadius: 5,
            //                     //blurStyle: BlurStyle.inner
            //                   )
            //                 ],
            //               ),
            //               child:
            //               Column(
            //                 children: [
            //                   FittedBox(
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(50),
            //                       child: Image.asset("Images/Products.png",
            //                       ),
            //                     ),
            //                   ),
            //                   SizedBox(height:8,),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Text(
            //                         list[index],
            //                         style: TextStyle(
            //                           color:  Colors.black87,
            //                           fontSize: 10.5,
            //                         ),
            //                       ),
            //                       Text(
            //                         Price,
            //                         style: TextStyle(
            //                           color:  Colors.black87,
            //                           fontSize: 10.5,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       }
            // ),
            //     ),


                SizedBox(height: 40,),

              ],
            ),
          ),

        ),
      ),
      // bottomNavigationBar: Container(
      //     height: 60,
      //     child: BottomNavBar(id: "profile",)
      // ),
    );
  }
}



// class Card extends StatelessWidget{
//   const Card({Key? key, required this.text1, required this.price, required this.image}) : super(key: key);
//   final String text1;
//   final String price;
//   final String image;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white70,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 15,
//           )
//         ],
//       ),
//       height: 80,
//       child: Row(
//         //mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SizedBox(width: 20,),
//           CircleAvatar(
//             radius: 45,
//             backgroundImage: AssetImage(image),
//           ),
//           //Image.asset(image,),
//           SizedBox(width: 20,),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 text1,
//                 style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                     color: GlobalColors.textColor
//                 ),
//               ),
//               SizedBox(height: 5,),
//               Text(
//                 price,
//                 style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400,
//                     color: GlobalColors.textColor
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//
//   }
// }