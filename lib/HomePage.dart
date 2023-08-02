import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veeki/BookAppointment/ViewBookingScreen.dart';
import 'package:veeki/CategoryList.dart';
import 'package:veeki/MyServiceListScreen.dart';
import 'package:veeki/Notifications.dart';
import 'package:veeki/PopularBarbers.dart';
import 'package:veeki/Products.dart';
import 'package:veeki/Profile.dart';
import 'package:veeki/ServiceList.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/PopularBarbersInHomePage.dart';
import 'package:veeki/widgets/ProductsInHomePage.dart';
import 'package:veeki/widgets/RecommendedBarbershopInHomePage.dart';
import 'package:veeki/widgets/SearchBar.dart';
import 'package:veeki/widgets/ServicesInHopePage.dart';
import 'package:veeki/widgets/CarouselWithIndicator.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;

import 'AddAvailabilityScreen.dart';
import 'TransactionHistoryScreen.dart';
import 'models/businessLayer/global.dart';
import 'widgets/ViewMyServiceScreen.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  HomePage ({Key? key,}) : super (key: key);
}

class _HomePageState extends State<HomePage> {
  TextEditingController _search = TextEditingController();
  int _current = 0;
 // var list = ['Captain Salon','Breaking Barbershop','Something Salon','Something Salon','Something Salon','Something Salon',];
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
                              child:

                              global.user.profileImage ==null?
                              CircleAvatar(
                                backgroundColor: GlobalColors.primaryColor,
                                radius: 32,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('assets/pic.png'),
                                ),
                              ):CircleAvatar(
                                backgroundColor: GlobalColors.primaryColor,
                                radius: 32,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage('${global.user.profileImage}'),
                                ),
                              ) ,
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
                              "Hi Buddy",
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
                                        "Ikeja, Lagos",
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
                                     // MaterialPageRoute(builder: (context) => Notifications()),
                                      MaterialPageRoute(builder: (context) => ViewBookingScreen()),
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
                global.user.role  == "USER" ?
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SearchBarForm(),
                ):SizedBox(height: 0,),
                global.user.role  == "USER" ?
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recommended Categories",style: TextStyle(fontWeight: FontWeight.bold,),),
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
                      global.user.role  != "SERVICE_PROVIDER" ?
                      Container(
                        height: 300,
                          child: ServicesInHopePage()
                      ): SizedBox(height: 1,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recommeded Services",style: TextStyle(fontWeight: FontWeight.bold,),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => ServiceList()),
                                  );
                                },
                                child: Text("See more",style: TextStyle(color: GlobalColors.primaryColor),))
                          ],
                        ),
                      ),


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
                          height: 110,
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
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context) => Products()),
                                // );
                              },
                                child: Text(
                                  " ",style: TextStyle(color: GlobalColors.primaryColor),
                                ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15),

                          child: ProductsInHomePage()
                      ),
                    ],
                  ),
                ):serviceProvider()
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

Widget serviceProvider(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddServiceScreen()));

              },
              child: Container(
                height: 100,
                width: 200,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                   // border: Border.all(width: 5, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.red
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white,size: 25,),
                    Text('Add a service', style: TextStyle(color: Colors.white, fontSize: 17),),
                  ],
                )
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionHistoryScreen()));


              },
              child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.green
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book, color: Colors.white,size: 25,),
                      Text('Transaction History', style: TextStyle(color: Colors.white, fontSize: 17),),
                    ],
                  )
              ),
            ),
          ),
        ],),
        SizedBox(height: 10,),
        Text(" My Services", style: TextStyle(color: Colors.black38,  fontSize: 14, fontWeight: FontWeight.bold),),
        Container(
          height: 300,
          child:
          MyServiceListScreen()
          ,),
        SizedBox(height: 30,),

      ],),
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
