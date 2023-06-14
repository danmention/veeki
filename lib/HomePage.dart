import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:veeki/CategoryList.dart';
import 'package:veeki/Notifications.dart';
import 'package:veeki/PopularBarbers.dart';
import 'package:veeki/Products.dart';
import 'package:veeki/Profile.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/PopularBarbersInHomePage.dart';
import 'package:veeki/widgets/ProductsInHomePage.dart';
import 'package:veeki/widgets/RecommendedBarbershopInHomePage.dart';
import 'package:veeki/widgets/SearchBar.dart';
import 'package:veeki/widgets/ServicesInHopePage.dart';
import 'package:veeki/widgets/CarouselWithIndicator.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  HomePage ({Key? key,}) : super (key: key);
}

class _HomePageState extends State<HomePage> {
  TextEditingController _search = TextEditingController();
  int _current = 0;
  var list = ['Captain Salon','Breaking Barbershop','Something Salon','Something Salon','Something Salon','Something Salon',];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            //padding: const EdgeInsets.only(left: 30.0,right: 30),
            child:

            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: GlobalColors.secondaryColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0,right: 0,left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Profile()),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: GlobalColors.primaryColor,
                                radius: 32,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('Images/download.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  global.user.fullName != null?
                                  Text(
                                    "${global.user.fullName}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ): Text(
                              "John Doe",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),

                                  Row(

                                    children: [
                                      Icon(Icons.location_on_outlined,color: Colors.white,size: 15,),
                                      global.user.city != null?
                                     Row(children: [
                                       Text(
                                         "${global.user.city}" ,
                                         style: TextStyle(
                                             fontSize: 13,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white
                                         ),
                                       ),Text(',', style: TextStyle(
                                           fontSize: 13,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white
                                       ),),
                                       Text(
                                         "${global.user.state}" ,
                                         style: TextStyle(
                                             fontSize: 13,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white
                                         ),
                                       ),
                                     ],): Text(
                                        "Liverpool, United Kingdom",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(

                              children: [
                               // Icon(Icons.search_outlined,color: Colors.white,),
                                SizedBox(width: 15,),

                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => Notifications()),
                                    );
                                  },
                                    child: Icon(Icons.notifications_none_outlined,color: Colors.white,
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),

                        child: Container(

                          width: 310,
                            child: CarouselWithIndicator()
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SearchBarForm(),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,),),
                          InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => CategoryList()),
                                );
                              },
                              child: Text("See more",style: TextStyle(color: GlobalColors.primaryColor),
                              )
                          )
                        ],
                      ),
                      Container(
                        height: 55,
                          child: ServicesInHopePage()
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recommeded Services",style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("See more",style: TextStyle(color: GlobalColors.primaryColor),)
                          ],
                        ),
                      ),

                    //     Container(
                    //   height: 160,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: list.length,
                    //       itemBuilder: (context, index){
                    //         return Padding(
                    //           padding: const EdgeInsets.only(left: 10.0,top: 0.0,bottom: 0.0,right: 8.0),
                    //           child: InkWell(
                    //             onTap: (){
                    //               // Navigator.of(context).push(
                    //               //     MaterialPageRoute(builder: (context) => Details())
                    //               // );
                    //             },
                    //             child: Container(
                    //               padding: EdgeInsets.all(6),
                    //               // alignment: Alignment.center,
                    //               height: 250,
                    //               width:  150,
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
                    //                       child: Image.asset("Images/HomepageBannerImage.png",
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
                    //                           fontWeight: FontWeight.w600,
                    //                           fontSize: 11,
                    //                         ),
                    //                       ),
                    //                       Row(
                    //                         children: [
                    //                           Text(
                    //                             "4.7",
                    //                             style: TextStyle(
                    //                               color:  Colors.black87,
                    //                               fontWeight: FontWeight.w600,
                    //                               fontSize: 10,
                    //                             ),
                    //                           ),
                    //                           Icon(Icons.star,color: Colors.yellow,size: 11,)
                    //                         ],
                    //                       ),
                    //
                    //                     ],
                    //                   ),
                    //                   SizedBox(height: 3,),
                    //                   Row(
                    //                     children: [
                    //                       Icon(Icons.location_on_outlined,size: 12,),
                    //                       SizedBox(height: 5,),
                    //                       Text(" St Luke's Guarden, Liverpool",
                    //                         style: TextStyle(
                    //                           color:  Colors.black87,
                    //                           fontSize: 9.5,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //   ),
                    // ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                           height: 150,
                          child: RecommendedBarbershopInHomePage()
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Popular Therapist",style: TextStyle(fontWeight: FontWeight.bold,),),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => PopularBarbers()),
                                );
                              },
                                child: Text("See more",style: TextStyle(color: GlobalColors.primaryColor),
                                ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 100,
                          child: PopularBarbersInHomePage()
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Products",style: TextStyle(fontWeight: FontWeight.bold,),),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Products()),
                                );
                              },
                                child: Text(
                                  "See more",style: TextStyle(color: GlobalColors.primaryColor),
                                ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(top: 15),
                      //     height: 170,
                      //     child: ProductsInHomePage()
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),

        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          child: BottomNavBar(id: "home",)
      ),
    );
  }




}
// class BannerImages {
//   static const String banner1 =
//       "Images/HomepageBannerImage2.png";
//   static const String banner2 =
//       "Images/HomepageBannerImage3.png";
//   static const String banner3 = "Images/HomepageBannerImage.png";
//
//   static List<BannerModel> listBanners = [
//     BannerModel(imagePath: banner1, id: "1"),
//     BannerModel(imagePath: banner2, id: "2"),
//     BannerModel(imagePath: banner3, id: "3"),
//   ];
// }