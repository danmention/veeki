// ignore_for_file: empty_constructor_bodies

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:veeki/BookAppointment/ChooseServiceScreen.dart';
import 'package:veeki/models/response/service_response.dart';
import 'package:veeki/photo_view_page.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/Details.DescriptionandInformation.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'BookAppointment/AppointmentsScreen.dart';
import 'HomePage.dart';
import 'models/businessLayer/base.dart';

class Details extends Base {
  Details ({this.service}) ;
  @override
  _DetailsState createState() => _DetailsState(this.service);

 final  Service? service;
}

class _DetailsState extends BaseState{
  _DetailsState(this.service);
   Service? service;
  PageController pageController = PageController(initialPage: 0, viewportFraction: 1);
  final List<String> photos = [];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            //padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage("Images/HomepageBannerImage.png"),
                    fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackButtonGlobal(
                              widget: HomePage(),
                            ),
                            Icon(Icons.favorite_outline_outlined,color: Colors.white,size: 25,)
                          ],
                        ),
                        service != null?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child:

                              Container(
                                width: 330,
                                child: Column(

                                  children: [
                                   // Text("Breaking Barbershop", style: TextStyle(color: Colors.white, fontSize: 20),),
                                   Text("${service?.title??" "}", overflow: TextOverflow.ellipsis,style:
                                   TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 13,top: 10),
                                      child: Row(
                                        children: [
                                         Text('₦', style: TextStyle(
                                             fontSize: 15,
                                             color: Colors.white
                                         ), ),
                                          Row(
                                            children: [
                                              Text("${service!.amount}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),SizedBox(width: 2,),

                                              Text("/ Hour",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(right: 13,top: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,color: Colors.white,size: 12,),
                                          Row(
                                            children: [
                                              Text("${service!.user!.first.city}",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white
                                                ),
                                              ),SizedBox(width: 5,),
                                              Text("${service!.user!.first.state}",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 15),
                            //   child: Row(
                            //
                            //     children: [
                            //       Text("5.00 ",
                            //         style: TextStyle(
                            //             color: Colors.white
                            //         ),
                            //       ),
                            //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                            //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                            //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                            //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                            //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                            //     ],
                            //   ),
                            // )
                          ],
                        ):Container()
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: GlobalColors.secondaryColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Services",style: TextStyle(
                          color:activePage==0 ? GlobalColors.primaryColor:Colors.white,
                        ),
                        ),

                        Text("Gallery",style: TextStyle(
                          color:activePage==1 ? GlobalColors.primaryColor:Colors.white,
                        ),
                        ),

                        Text("About",style: TextStyle(
                          color:activePage==2 ? GlobalColors.primaryColor:Colors.white,
                        ),
                        ),
                        Text("Review",style: TextStyle(
                          color:activePage==3 ? GlobalColors.primaryColor:Colors.white,
                         ),
                        ),

                      ],
                    ),
                  ),
                ),

            SizedBox(
                height: MediaQuery.of(context).size.height*0.9,
              child: PageView(
                controller: pageController,
              onPageChanged: (int page) {
                  setState(() {
                  activePage = page;
                  });
                 },
                children:  [PageOne(), PageTwo(), PageThree(),PageFour()],),
            ),








              ],
            ),
          ),

        ),
      ),

    );
  }

@override
  void initState() {
  getimages();
    // TODO: implement initState
    super.initState();
  }

getimages()async{
   service!.images!.forEach((element) {
     photos.add( element.images!) ;
  });
}
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

 Widget PageTwo() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.all(1),
      itemCount: photos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: ((context, index) {
        return Container(
          padding: const EdgeInsets.all(0.5),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PhotoViewPage(photos: photos, index: index),
              ),
            ),
            child: Hero(
              tag: photos[index],
              child: CachedNetworkImage(
                imageUrl: photos[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => Container(
                  color: Colors.red.shade400,
                ),
              ),
            ),
          ),
        );
      }),
    );
 }

 Widget PageOne() {
   return Column(
     children: [   DescriptionandInformation(service: service,),
       SizedBox(height: 20,),
       InkWell(
         onTap: (){
           Navigator.of(context).push(
             MaterialPageRoute(builder: (context) => AppointmentsScreen(service: service,)),
           );
         },
         child: Container(
           alignment: Alignment.center,
           height: 45,
           width: 200,
           decoration: BoxDecoration(
             color: GlobalColors.primaryColor,
             borderRadius: BorderRadius.circular(6),
             boxShadow: [
               BoxShadow(
                 color: Colors.black.withOpacity(0.1),
                 blurRadius: 10,
               )
             ],
           ),
           child: Text(
             "Book Appointment",
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.w600,
               fontSize: 16,
             ),
           ),

         ),
       ),]
   );
 }

  Widget PageThree() {
    return Container(
      child: Text(' page 3'),
    );
  }

  Widget PageFour() {
    return Container(
      child: Text(' page 4'),
    );
  }
}
